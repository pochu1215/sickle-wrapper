# Sickle Wrapper Deployment Report V2

## Status Update: 2026-03-16
Pivot to Fork Simulation.
The Sepolia deployments were reverting with 'invalid jump'. This is likely due to CODESIZE/JUMPDEST misalignment in the patched bytecode.
We have shifted to Mainnet Fork Simulation for logic validation.
Simulation confirms 5% fee routing works correctly.
New test added: test/fork/AerodromeHarvest.base.t.sol.
Next Step: Run the fork test to verify Aerodrome-strategies.