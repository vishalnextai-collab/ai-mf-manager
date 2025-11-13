FROM n8nio/n8n:latest

ENV NODE_ENV=production

COPY workflow.json /home/node/.n8n/workflow.json

CMD ["n8n", "start"]
