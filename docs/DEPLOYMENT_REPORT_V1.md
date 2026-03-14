# Sickle Wrapper Deployment Report V1

## Overview
This report tracks the validation and deployment of the Sickle Wrapper for Aerdrome LP farming.


## Fork Simulation Success
- **Fee Configuration**: 500 BPS (5%)
- **Result**: Successfully extracted 5% from AERO harvest and routed to x0fF828F0d... in Base Mainnet fork simulation.
- **Math Verified**: Reinvestment of 95% net rewards confirmed.

## Mainnet Strategy Mapping
- **Registry**: 0x2ef5eafa8711e2441bd519eed5d09f8dfef2ecf3
- **Factory**: 0x71d234a3e1dfc161cc1d081e6496e76627baac31
- **Automation**: 0xebe78f29fa7f35c13f126f9aa10cf7b4f49f47d2

## Base Sepolia Deployment

- +**SickleRegistry**: `0xc4b3c1e9fc678b90ea8e179483e7a9580a9da139f`
- +**SickleFactory**: `0x865c1ce8a629ac33df647b6d1b48100c2fd193ea@
- +**Mock Sickle (Implementation**: `0xe032d4faa093499a996cc22806763b0db9b85e97`

## Compiler Blocker

The `SMARTCONTRACT_GetBytecode` tool is currently experiencing a regression. As a result, the team has adopted a **Mainnet Extraction** strategy for Base infrastructure, relying on existing mainnet bytecode rather than fresh compilation where necessary.

Custom contract deployment flows- specifically for **RewardRouter** and **WrapperFactory** - are temporarily paused and will resume once the `SMARTCONTRACT_GetBytecode` tool is restored and stable.