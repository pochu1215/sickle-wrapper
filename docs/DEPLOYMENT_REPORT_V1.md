# Sickle Wrapper — Deployment Report V1

## Summary
This report documents the Sickle Wrapper deployment and validation status on Base Sepolia and Base Mainnet.

## Base Sepolia (Testnet)
- [read] SickleRegistry: `0xc4b3c1e9fc678b90ea8e179483e7a9580a9da39f`
- [pending] SickleFactory
- [pending] RewardRouter
- [pending] WrapperFactory

## Base Mainnet (Strategy Mapping)
- FarmStrategy: `0x5A72C0f4Bf8A04E72F995D3f36940B79555C8A04`
- SlipstreamNftConnector: `0xb156de7c7b809890cc5f009623e1443653133ab3d[
- SickleFactory: `0x71d234a3e1dfc161cc1d081e6496e76627baac31`
- SickleRegistry: `0x2ef5eafa8711e2441bd519eed5d09f8djef2ecf3`

## High-Fidelity Fork Simulation Results
- **Scenario**: Aerodrome WETH/USDC (CL100) Harvest
- **input**: 1000 AERO reward
- **Fee Configuration**: 500 BPS (5%)
- **Fee Recipient**: `0xfF828F0d9589D111175e4636014088E030E8768B`
- **Outcome**:
  - Total Harvested: 1000 AERO
  - Fee Collected: 50 AERO
  - User Net/Reinvested: 950 AERO
- **Validation**: Verified on Base Mainnet Fork using Foundry (test/SickleForkSimulation.t.sol).

## Next Steps
1. Deploy mock infrastructure on Base Sepolia once conpide blockers are resolved.
2. Perform end-to-end testnet experiment with custom fee routing.