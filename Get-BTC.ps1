# Define API endpoint for BTC price (CoinGecko)
$apiURL = "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd"

# Function to fetch BTC price
function Get-BTCPrice {
    try {
        # Send GET request to the API
        $response = Invoke-RestMethod -Uri $apiURL -Method Get
        
        # Extract the BTC price
        $btcPrice = $response.bitcoin.usd
        Write-Host "Current BTC Price: $($btcPrice) USD" -ForegroundColor Green
    } catch {
        Write-Host "Error fetching BTC price: $_" -ForegroundColor Red
    }
}

# Infinite loop to fetch BTC price every minute
while ($true) {
    Clear-Host
    Get-BTCPrice
    Start-Sleep -Seconds 60
}
