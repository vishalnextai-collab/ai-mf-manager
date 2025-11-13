# ✅ Use official n8n image
FROM n8nio/n8n:latest

# Set environment
ENV NODE_ENV=production
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_USER_FOLDER=/home/node/.n8n

# Switch to node user before copy (avoids chown errors)
USER node

# Copy your workflow file with correct ownership
COPY --chown=node:node workflow.json ${N8N_USER_FOLDER}/workflow.json

# ✅ Start n8n
CMD ["tini", "--", "n8n", "start"]
