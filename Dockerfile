# Use official n8n Docker image
FROM n8nio/n8n:latest

# Set environment path (Render auto-adds ENV vars)
ENV NODE_ENV=production

# Copy workflow JSON into container (optional)
COPY workflow.json /home/node/.n8n/workflow.json

# Start n8n
CMD ["n8n", "start"]
