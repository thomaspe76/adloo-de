#!/bin/bash
# Plesk Git Deployment Script für adloo.de
# Dieses Script wird von Plesk nach jedem git pull ausgeführt.
# Es baut die Astro-Seite und kopiert den Output ins Document Root.

set -e

echo "=== adloo.de Deployment ==="
echo "Node version: $(node --version)"
echo "npm version: $(npm --version)"

# Dependencies installieren
npm ci --production=false

# Astro Build (statischer Output nach dist/)
npm run build

# Build-Output ins Plesk Document Root kopieren
# Plesk setzt $DOCUMENT_ROOT oder du passt den Pfad hier an
DEPLOY_DIR="${DOCUMENT_ROOT:-$(pwd)}"

if [ "$DEPLOY_DIR" != "$(pwd)" ]; then
  echo "Deploying to $DEPLOY_DIR ..."
  # Alte Dateien entfernen (aber .well-known behalten für SSL)
  find "$DEPLOY_DIR" -mindepth 1 -not -path "$DEPLOY_DIR/.well-known*" -not -name ".htaccess" -delete 2>/dev/null || true
  # Neue Dateien kopieren
  cp -r dist/* "$DEPLOY_DIR/"
  echo "Deployment complete!"
else
  echo "Build complete! Output in dist/"
  echo "Konfiguriere in Plesk: Document Root -> {repo}/dist"
fi
