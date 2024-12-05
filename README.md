# RateConverter

## Learnings:
- **If working with small units, it is best to convert to WEI** to avoid lost precision.
- **Chainlink prices are typically returned with 8 decimals**, so you need to scale appropriately.
- **To avoid precision loss, especially with small amounts like 50 USD**, it is best to first multiply it with 8 decimal places like it is with Chainlink prices, then multiply by \( 1.0 \times 10^{18} \) to convert to WEI, and finally divide by the Chainlink price with 8 decimal places.

### Example:
\[
50 \times 1e8 \times 1e18 / 3.91311219864 \times 10^{11}
\]
