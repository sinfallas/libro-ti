#!/usr/bin/env node
// SPDX-License-Identifier: CC-BY-SA-4.0
// Copyright (C) 2026 Jesus A. Palencia S.
// Renderizador determinista offline de diagramas Mermaid (.mmd -> .png 300 DPI).

import fs from "node:fs";
import path from "node:path";
import { createRequire } from "node:module";

const require = createRequire("/opt/mermaid-renderer/package.json");
const { chromium } = require("playwright-core");
const mermaidBundlePath = require.resolve("mermaid/dist/mermaid.min.js");

function findChromiumExecutable() {
  const baseDir = "/ms-playwright";
  if (!fs.existsSync(baseDir)) {
    throw new Error(`No existe ${baseDir} en el contenedor.`);
  }
  for (const entry of fs.readdirSync(baseDir).sort()) {
    if (entry.startsWith("chromium-")) {
      const candidate = path.join(baseDir, entry, "chrome-linux", "chrome");
      if (fs.existsSync(candidate)) {
        return candidate;
      }
    }
    if (entry.startsWith("chromium_headless_shell-")) {
      const candidate = path.join(baseDir, entry, "chrome-linux", "headless_shell");
      if (fs.existsSync(candidate)) {
        return candidate;
      }
    }
  }
  throw new Error("No se encontro ejecutable Chromium preinstalado en /ms-playwright.");
}

async function main() {
  const diagramDir = path.resolve(process.argv[2] || "diagramas");
  if (!fs.existsSync(diagramDir)) {
    console.log(`Directorio '${diagramDir}' inexistente; nada que renderizar.`);
    return;
  }

  const mmdFiles = fs
    .readdirSync(diagramDir)
    .filter((f) => f.endsWith(".mmd"))
    .sort();

  if (mmdFiles.length === 0) {
    console.log(`Sin archivos .mmd en '${diagramDir}'; nada que renderizar.`);
    return;
  }

  const mermaidJs = fs.readFileSync(mermaidBundlePath, "utf8");
  const executablePath = findChromiumExecutable();

  const browser = await chromium.launch({
    executablePath,
    headless: true,
    args: [
      "--no-sandbox",
      "--disable-setuid-sandbox",
      "--disable-dev-shm-usage",
      "--disable-gpu",
      "--font-render-hinting=none",
    ],
  });

  try {
    const context = await browser.newContext({
      viewport: { width: 1600, height: 1200 },
      deviceScaleFactor: 3,
    });
    const page = await context.newPage();

    for (const file of mmdFiles) {
      const srcPath = path.join(diagramDir, file);
      const outPath = path.join(diagramDir, file.replace(/\.mmd$/, ".png"));
      const tmpPath = `${outPath}.tmp`;
      const definition = fs.readFileSync(srcPath, "utf8");

      const html = `<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body {
      background: #ffffff;
      padding: 24px;
      display: inline-block;
      font-family: "Liberation Sans", "DejaVu Sans", Arial, sans-serif;
    }
    #container { display: inline-block; background: #ffffff; }
  </style>
</head>
<body>
  <div id="container"><pre class="mermaid"></pre></div>
  <script>${mermaidJs}</script>
  <script>
    window.__renderDiagram = async (code) => {
      mermaid.initialize({
        startOnLoad: false,
        securityLevel: "strict",
        theme: "neutral",
        flowchart: {
          htmlLabels: true,
          curve: "basis",
          padding: 14,
          subGraphTitleMargin: { top: 10, bottom: 16 }
        },
        themeVariables: {
          fontFamily: '"Liberation Sans", "DejaVu Sans", Arial, sans-serif',
          fontSize: "15px",
          primaryColor: "#f1f5f9",
          primaryTextColor: "#0f172a",
          primaryBorderColor: "#334155",
          lineColor: "#334155",
          secondaryColor: "#e2e8f0",
          tertiaryColor: "#f8fafc"
        }
      });
      const { svg } = await mermaid.render("mmd-svg", code);
      if (svg.includes("Unsupported markdown") || svg.includes("Syntax error in text")) {
        throw new Error("Mermaid detecto sintaxis o markdown no soportado en el diagrama.");
      }
      document.getElementById("container").innerHTML = svg;
      return true;
    };
  </script>
</body>
</html>`;

      await page.setContent(html, { waitUntil: "load" });
      await page.evaluate((code) => window.__renderDiagram(code), definition);

      const locator = page.locator("#container");
      await locator.screenshot({ path: tmpPath, type: "png" });
      fs.renameSync(tmpPath, outPath);
      console.log(`Diagrama renderizado: ${path.relative(process.cwd(), outPath)}`);
    }

    await context.close();
  } finally {
    await browser.close();
  }
}

main().catch((err) => {
  console.error("ERROR renderizando diagramas Mermaid:", err.message || err);
  process.exit(1);
});
