# Uniswap Labs: Front End Interfaces

An open source repository for all Uniswap front end interfaces maintained by Uniswap Labs. Uniswap is a protocol for decentralized exchange of Ethereum tokens.

## Interfaces

- Web: [app.uniswap.org](https://app.uniswap.org)
- Wallet: [wallet.uniswap.org](https://wallet.uniswap.org)

## Socials / Contact

- Twitter: [@Uniswap](https://twitter.com/Uniswap)
- Reddit: [/r/Uniswap](https://www.reddit.com/r/Uniswap/)
- Email: [contact@uniswap.org](mailto:contact@uniswap.org)
- Discord: [Uniswap](https://discord.gg/FCfyBSbCU5)

## Uniswap Links

- Website: [uniswap.org](https://uniswap.org/)
- Docs: [uniswap.org/docs/](https://docs.uniswap.org/)

## Whitepapers

- [V3](https://uniswap.org/whitepaper-v3.pdf)
- [V2](https://uniswap.org/whitepaper.pdf)
- [V1](https://hackmd.io/C-DvwDSfSxuh-Gd4WKE_ig)

## Apps

For instructions per application or package, see the README published for each application:

- [Web](apps/web/README.md)
- [Mobile](apps/mobile/README.md)

## Releases

All interface releases are tagged and published to this repository. To browse them easily, see the [Github releases tab](https://github.com/Uniswap/interface/releases).

## Translations

Translations for our applications are done through [crowdin](https://crowdin.com).

| App     | Coverage |
| ------- | -------- |
| web     | [![Crowdin](https://badges.crowdin.net/uniswap-interface/localized.svg)](https://crowdin.com/project/uniswap-interface) |
| mobile  | [![Crowdin](https://badges.crowdin.net/uniswap-wallet/localized.svg)](https://crowdin.com/project/uniswap-wallet) |

## 🗂 Directory Structure

| Folder      | Contents                                                                       |
| ----------- | ------------------------------------------------------------------------------ |
| `apps/`     | The home for each standalone application.                                      |
| `config/`   | Shared infrastructure packages and configurations.                             |
| `packages/` | Shared code packages covering UI, shared functionality, and shared utilities.  |

## IPFS Deployment Guide

To properly deploy the application to IPFS:

1. Run the build-for-ipfs.sh script to create the optimized build:
   ```
   ./build-for-ipfs.sh
   ```

2. Once the build completes, you'll have a directory called `ipfs-build/` in the project root.

3. **IMPORTANT**: Only upload the *contents* of the `ipfs-build/` directory to IPFS, not the entire project.

   This ensures that:
   - The `index.html` file is at the root level
   - Only production assets are included (not source code, configuration files, etc.)
   - The IPFS gateway will display your website correctly instead of a directory listing

4. If you're using Fleek, Pinata, or another IPFS pinning service, point it to the `ipfs-build/` directory.

Common IPFS Deployment Issues:
- If you see a directory listing when accessing your IPFS hash, you've likely uploaded the entire project instead of just the build output
- Make sure the upload includes the `index.html` file at the root level
- The total size should be much smaller than the entire project (typically <100MB vs several GB)
