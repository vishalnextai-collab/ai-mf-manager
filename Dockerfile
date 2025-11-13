# Use official n8n image
FROM n8nio/n8n:latest

# Environment setup
ENV NODE_ENV=production
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_USER_FOLDER=/home/node/.n8n

# Copy workflow file with proper ownership
USER root
COPY --chown=node:node workflow.json ${N8N_USER_FOLDER}/workflow.json

# Switch back to node user
USER node

# ✅ Use the base image entrypoint (includes tini + n8n)
ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
