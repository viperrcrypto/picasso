#!/usr/bin/env node

import { existsSync, mkdirSync, cpSync, readdirSync, readFileSync } from "fs";
import { resolve, join, dirname } from "path";
import { fileURLToPath } from "url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const packageRoot = resolve(__dirname, "..");
const skillSource = join(packageRoot, "skills", "picasso");
const agentSource = join(packageRoot, "agents", "picasso.md");
const commandsSource = join(packageRoot, "commands");

const args = process.argv.slice(2);
const command = args[0] || "install";

if (command === "help" || command === "--help" || command === "-h") {
  console.log(`
  picasso-skill - The ultimate AI design skill + agent

  Usage:
    npx picasso-skill              Install skill + agent to current project
    npx picasso-skill --global     Install globally (~/.claude/)
    npx picasso-skill --skill-only Install skill only (no agent)
    npx picasso-skill --cursor     Install skill for Cursor
    npx picasso-skill --codex      Install skill for Codex
    npx picasso-skill --openclaw   Install skill for OpenClaw (project skills/)
    npx picasso-skill --openclaw -g Install skill for OpenClaw globally (~/.openclaw/skills/)
    npx picasso-skill --agents     Install to .agents/skills/
    npx picasso-skill --path DIR   Install to a custom directory

  What gets installed:
    .claude/skills/picasso/        Skill (knowledge base: 33 reference files)
    .claude/agents/picasso.md      Agent (visual discovery + design validation)
  `);
  process.exit(0);
}

const isGlobal = args.includes("--global") || args.includes("-g");
const skillOnly = args.includes("--skill-only");
const home = process.env.HOME || process.env.USERPROFILE;

let skillDir;
let agentDir;

// OpenClaw must be checked BEFORE generic isGlobal to handle --openclaw -g correctly
if (args.includes("--openclaw")) {
  if (isGlobal) {
    skillDir = join(home, ".openclaw", "skills", "picasso");
  } else {
    skillDir = join(process.cwd(), "skills", "picasso");
  }
  agentDir = null; // OpenClaw uses SOUL.md, not agents/
} else if (args.includes("--cursor")) {
  skillDir = join(process.cwd(), ".cursor", "skills", "picasso");
  agentDir = null; // Cursor doesn't support agents
} else if (args.includes("--codex")) {
  skillDir = join(home, ".codex", "skills", "picasso");
  agentDir = null;
} else if (isGlobal) {
  skillDir = join(home, ".claude", "skills", "picasso");
  agentDir = join(home, ".claude", "agents");
} else if (args.includes("--agents")) {
  skillDir = join(process.cwd(), ".agents", "skills", "picasso");
  agentDir = null;
} else if (args.includes("--path")) {
  const pathIdx = args.indexOf("--path");
  const customPath = args[pathIdx + 1];
  if (!customPath) {
    console.error("Error: --path requires a directory argument");
    process.exit(1);
  }
  skillDir = resolve(customPath, "picasso");
  agentDir = null;
} else {
  // Default: project-level Claude Code
  skillDir = join(process.cwd(), ".claude", "skills", "picasso");
  agentDir = join(process.cwd(), ".claude", "agents");
}

if (skillOnly) agentDir = null;

console.log(`\n  Installing Picasso to: ${skillDir}\n`);

try {
  // Install skill
  mkdirSync(skillDir, { recursive: true });
  mkdirSync(join(skillDir, "references"), { recursive: true });

  cpSync(join(skillSource, "SKILL.md"), join(skillDir, "SKILL.md"));

  const refs = readdirSync(join(skillSource, "references"));
  for (const ref of refs) {
    cpSync(
      join(skillSource, "references", ref),
      join(skillDir, "references", ref)
    );
  }

  console.log(`  Skill installed (${1 + refs.length} files):`);
  console.log(`    SKILL.md`);
  for (const ref of refs) {
    console.log(`    references/${ref}`);
  }

  // Install agent
  if (agentDir && existsSync(agentSource)) {
    mkdirSync(agentDir, { recursive: true });
    cpSync(agentSource, join(agentDir, "picasso.md"));
    console.log(`\n  Agent installed:`);
    console.log(`    ${join(agentDir, "picasso.md")}`);
  }

  // Install commands
  const commandsDir = agentDir ? join(agentDir, "..", "commands") : null;
  if (commandsDir && existsSync(commandsSource)) {
    mkdirSync(commandsDir, { recursive: true });
    const cmds = readdirSync(commandsSource).filter(f => f.endsWith(".md"));
    for (const cmd of cmds) {
      cpSync(join(commandsSource, cmd), join(commandsDir, cmd));
    }
    console.log(`\n  Commands installed (${cmds.length}):`);
    for (const cmd of cmds) {
      console.log(`    /${cmd.replace(".md", "")}`);
    }
  }

  console.log(`\n  Picasso is ready. Start designing.\n`);

  if (agentDir) {
    console.log(`  15 commands: /godmode /roast /score /mood /evolve /steal /compete`);
    console.log(`               /variants /preset /preview /figma /backlog /autorefine`);
    console.log(`               /quick-audit /before-after\n`);
  }
} catch (err) {
  console.error(`  Error installing: ${err.message}`);
  process.exit(1);
}
