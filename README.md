# Decentralized Energy Demand Response System

A blockchain-based system for managing energy demand response using Clarity smart contracts on the Stacks blockchain.

## Overview

This project implements a decentralized energy demand response system that allows utilities to request energy consumption reductions during peak demand periods and incentivize consumers for their participation.

The system consists of five core smart contracts:

1. **Utility Verification Contract**: Validates and registers energy providers
2. **Consumer Registration Contract**: Records energy users and their consumption capacities
3. **Load Forecasting Contract**: Predicts peak demand periods
4. **Reduction Request Contract**: Manages consumption decrease requests
5. **Incentive Distribution Contract**: Handles participation payments

## Smart Contracts

### Utility Verification Contract

This contract maintains a registry of verified energy utilities. Only verified utilities can create load forecasts, reduction requests, and incentive programs.

Key functions:
- `register-utility`: Add a new utility to the registry
- `deactivate-utility`: Remove a utility from the registry
- `is-verified-utility`: Check if a utility is verified

### Consumer Registration Contract

This contract maintains a registry of energy consumers. Consumers can register with their utility provider and specify their consumption capacity.

Key functions:
- `register-consumer`: Add a new consumer to the registry
- `update-capacity`: Update a consumer's consumption capacity
- `deactivate-consumer`: Remove a consumer from the registry

### Load Forecasting Contract

This contract allows utilities to create load forecasts for specific time periods. Forecasts include predicted load and threshold values for determining peak demand periods.

Key functions:
- `create-forecast`: Create a new load forecast
- `update-forecast`: Update an existing forecast
- `is-peak-period`: Check if current load exceeds the threshold

### Reduction Request Contract

This contract allows utilities to create reduction requests during peak demand periods. Consumers can commit to reducing their energy consumption in response to these requests.

Key functions:
- `create-reduction-request`: Create a new reduction request
- `commit-to-reduction`: Consumer commits to reducing consumption
- `report-actual-reduction`: Utility reports actual reduction achieved

### Incentive Distribution Contract

This contract handles the distribution of incentives to consumers who participate in reduction requests. Utilities can create incentive programs for specific reduction requests and calculate incentives based on actual reductions achieved.

Key functions:
- `create-incentive-program`: Create a new incentive program
- `calculate-incentive`: Calculate incentive for a consumer
- `mark-incentive-paid`: Mark an incentive as paid

## System Flow

1. Utilities are verified through the Utility Verification Contract
2. Consumers register through the Consumer Registration Contract
3. Utilities create load forecasts to predict peak demand periods
4. When a peak period is anticipated, utilities create reduction requests
5. Consumers commit to reducing their energy consumption
6. After the reduction period, utilities report actual reductions
7. Incentives are calculated and distributed to participating consumers

## Testing

The project includes comprehensive tests for each contract using Vitest. The tests cover all major functionality and edge cases.

## Getting Started

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) - A Clarity development environment
- [Node.js](https://nodejs.org/) - For running tests

### Installation

1. Clone the repository
2. Install dependencies:
