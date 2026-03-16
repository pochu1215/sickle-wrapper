# CLAUDE.md

Internal orientation + working notes for Claude on the **Sickle Builder** repo.

This file is meant to keep you (Claude) aligned with:
- What this project is
- How the codebase is structured
- How to run and extend tests
- What to focus on next

Update this file as the codebase evolves so future interactions stay in sync.

---

## 1. High-level objective

This repo implements and tests on-chain “Sickle” strategies, with an emphasis on:

- Safe, production-like testing via mainnet forking
- Strategy-specific harvesting logic (e.g. Aorodrome on Base)
- Correct handling of protocol fees (e.g. 5% fee routing)
- Gas- and safety-conscious Solidity patterns

Your role is to:
- Help reason about strategy design and edge cases
- Propose and refine tests (especially fork tests)
- Keep this CLAUDE.md aligned with actual committed code and tests

---

## 2. Codebase orientation

### 2.1 Contracts

Typical layout:

- `src/`
  - `RewardRouter.sol`: Implements IRewardRouter, handles 5% fee extraction:
  - `SickleWrapper.sol`: Per-user wrapper that owns a Sickle wallet.
  - `WrapperFactory.sol`: Factory for creating deterministic wrappers via CREATE2.

### 2.2 Tests

- `test/`
  - `fork/`
    - `AerodromeHarvest.base.t.sol`: High-fidelity Base mainnet fork test for Aerodrome harvests and fee routing.

---

### 3. Development guidelines

1. **Minimize diff footprint**
2. **Defensive coding**
1. **Explicit configuration**
2. **Test-first or test-parallel**

---

## 4. Testing

### 4.1 General testing notes

- Test runner: Foundry
- Command: `forge test --match-path test/fork/AerodromeHarvest.base.t.sol -vv`

---

## 5. Current progress

- [x] Initial repository audit (CARD-001)
- [x] Map production addresses for Sickle infrastructure on Base
- [x] Commit High-Fidelity Fork Simulation (`test/fork/AerodromeHarvest.base.t.sol`)
- [x] Implement 5% fee routing logic in `RewardRouter.sol`
- [x] Initial UI MVP structure pushed to `pochu1215/sickle-steward-interface

---

### 6. Next steps / focus areas

1. **Base Sepolia Infrastructure**: Finalize SickleFactory deployment via manual bytecode extraction to bypass compiler outage.
2. **UI Integration**: Help Steward connect Vercel and Supabase to the frontend MVP.
3. **End-to-End Simulation**: Run a live testnet harvest simulation once infrastructure is stable.

---

### 7. Coding & style notes

Follow the existing repo style: descriptive test names, concise comments, and explicit visibility.
