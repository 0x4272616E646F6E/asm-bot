# ASM-Bot
ASM is a rewrite of another project that I worked on originally written in Golang. [discord-gopilot](https://github.com/DeviousLabs/discord-gopilot).



Why Assembly now? 
- Purely for learning and improving my understanding of assembly language.


ASM-Bot is a Discord bot written in x86/64 Assembly that integrates AI models via the Cloudflare AI API. It allows users to generate code snippets, solve algorithmic problems, and assist with project tasks directly within their Discord channels, making AI tools easily accessible to everyone.

### Docker Build Example
```
docker build -t asm-bot:latest
```

### Docker Run Example
```
docker run -e CLOUDFLARE_ACCOUNT_ID='ACCOUNT_ID' CLOUDFLARE_API_TOKEN='TOKEN' DISCORD_TOKEN='TOKEN' MODEL='MODEL_ID' asm-bot:latest
```

### Dock-Compose.yml Example
```
version: '3.7'
  services:
    asm-bot:
      image: "asm-bot:latest"
      container_name: "asm-bot"
      environment:
        CLOUDFLARE_ACCOUNT_ID: "ACCOUNT_ID"
        CLOUDFLARE_API_TOKEN: "TOKEN"
        DISCORD_TOKEN: "TOKEN"
        MODEL: "MODEL_ID"
      restart: "unless-stopped"
```
### Models Available
|  ID  | Model Name                        | Available |
|------|-----------------------------------|-----------|
|1     | Coming Soon...           | ❌


### Contributing

Contributions are welcome! Please follow these security best practices:

Pull Requests: Submit changes through pull requests for code review.

Security Testing: Run all tests, including static analysis and dependency checks.

Secrets Management: Do not hardcode any sensitive information; use environment variables.

### License

This project is open source under the MIT License.

