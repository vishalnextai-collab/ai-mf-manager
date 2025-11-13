# ✅ Use official n8n base image
FROM n8nio/n8n:latest

# Set environment
ENV NODE_ENV=production
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_USER_FOLDER=/home/node/.n8n

# Copy your workflow file into the correct folder
COPY workflow.json ${N8N_USER_FOLDER}/workflow.json

# Ensure permissions are correct
RUN chown -R node:node ${N8N_USER_FOLDER}

# Switch to node user (required by n8n)
USER node

# ✅ Start n8n correctly
CMD ["tini", "--", "n8n", "start"]
