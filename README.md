# CheckIP

[![CI](https://github.com/checkip/checkip/workflows/CI/badge.svg?branch=main)](https://github.com/checkip/checkip/actions?query=workflow%3ACI)
[![Depfu](https://badges.depfu.com/badges/c6f8940cb635203631089a8f49a59ab0/overview.svg)](https://depfu.com/github/checkip/checkip?project_id=32130)

CheckIP is an open-source tool for IP address research and analysis. It can be used as a standalone service or with existing infrastructure for privacy-sensitive tasks. Support IPv4 and IPv6.

## Development

Ensure your system has the [Ruby](https://www.ruby-lang.org/) version specified in the [`.ruby-version`](.ruby-version) and [Yarn v1 (classic)](https://classic.yarnpkg.com/).

```bash
# Clone repository
git clone git@github.com:checkip/checkip.git

# Change directory
cd checkip

# Update environment variables
cp .env.development.template .env.development

# Install Ruby dependencies
bundle install

# Install Yarn dependencies
yarn install

# Download geolocation databases
bundle exec rake mmdb:update

# Start application
bin/dev
```
## Sponsors

<a href="https://www.jetbrains.com/"><img src="https://resources.jetbrains.com/storage/products/company/brand/logos/jb_beam.svg" alt="Sponsored by JetBrains" width="120" height="120"></a>

## License

Copyright 2020 - 2022 Dmitriy Tarasov. Released under the [BSD-3-Clause](LICENSE) license.
