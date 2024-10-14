// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

abstract contract SourceCode {
    string internal sourceCodeGetPrices =
        "const { ethers } = await import('npm:ethers@6.10.0'); const abiCoder = ethers.AbiCoder.defaultAbiCoder(); const saId = args[0]; const apiResponse = await Functions.makeHttpRequest({ url: `https://seeking-alpha.p.rapidapi.com/market/get-realtime-quotes`, params: { sa_ids: saId }, headers: { 'x-rapidapi-key': 'mXoswGhVcwmshI2rMojxtdAUtmd9p1fAuPgjsnvbmQIJRb3SXg', 'x-rapidapi-host': 'seeking-alpha.p.rapidapi.com' }}); if (apiResponse.error) { console.error(apiResponse.error); throw Error('Request failed'); } const { data } = apiResponse; const encoded = abiCoder.encode([`string`, `string`, `string`], [data.real_time_quotes[0].symbol, data.real_time_quotes[0].last, data.real_time_quotes[0].last_time]); console.log(encoded); return ethers.getBytes(encoded);";

    // string internal sourceCodeGetPrices =
    //     "// This function gets real-time quotes from Seeking Alpha. This example will showcase usage of HTTP requests and console.logs."
    //     "// 1, 2, 3 etc."
    //     "const { ethers } = await import('npm:ethers@6.10.0');"
    //     "const abiCoder = ethers.AbiCoder.defaultAbiCoder();"
    //     "const saId = args[0]; // The SA ID for the request"
    //     "// Execute the API request (Promise)"
    //     "const apiResponse = await Functions.makeHttpRequest({"
    //     "  url: `https://seeking-alpha.p.rapidapi.com/market/get-realtime-quotes`,"
    //     "  params: { sa_ids: saId }, // Set the parameter for the SA ID"
    //     "  headers: {"
    //     "    'x-rapidapi-key': 'mXoswGhVcwmshI2rMojxtdAUtmd9p1fAuPgjsnvbmQIJRb3SXg',"
    //     "    'x-rapidapi-host': 'seeking-alpha.p.rapidapi.com'"
    //     "  }"
    //     "});"
    //     "if (apiResponse.error) {"
    //     "  console.error(apiResponse.error);"
    //     "  throw Error('Request failed');"
    //     "}"
    //     "const { data } = apiResponse;"
    //     "const symbol = data.real_time_quotes[0].symbol;"
    //     "const lastPrice = data.real_time_quotes[0].last;"
    //     "const lastTime = data.real_time_quotes[0].last_time;"
    //     "// // // Encode data for NFT use"
    //     "const encoded = abiCoder.encode("
    //     "  [`string`, `string`, `string`],"
    //     "  [symbol, lastPrice, lastTime]"
    //     ");"
    //     "console.log(encoded);"
    //     "console.log('API response data:', JSON.stringify(data, null, 2));"
    //     "// Return the symbol from the real_time_quotes array"
    //     "// return Functions.encodeString(data.real_time_quotes[0].symbol);"
    //     "return ethers.getBytes(encoded);";

    // string public sourceCodeGetPrices =
    //     "// This function gets real-time quotes from Seeking Alpha. This example will showcase usage of HTTP requests and console.logs."
    //     "// 1, 2, 3 etc."
    //     "const { ethers } = await import('npm:ethers@6.10.0');"
    //     "const abiCoder = ethers.AbiCoder.defaultAbiCoder();"
    //     "const saId = args[0]; // The SA ID for the request"
    //     "// Execute the API request (Promise)"
    //     "const apiResponse = await Functions.makeHttpRequest({"
    //     "  url: `https://seeking-alpha.p.rapidapi.com/market/get-realtime-quotes`,"
    //     "  params: { sa_ids: saId }, // Set the parameter for the SA ID"
    //     "  headers: {"
    //     "    'x-rapidapi-key': 'mXoswGhVcwmshI2rMojxtdAUtmd9p1fAuPgjsnvbmQIJRb3SXg',"
    //     "    'x-rapidapi-host': 'seeking-alpha.p.rapidapi.com'"
    //     "  }"
    //     "});"
    //     "if (apiResponse.error) {"
    //     "  console.error(apiResponse.error);"
    //     "  throw Error('Request failed');"
    //     "}"
    //     "const { data } = apiResponse;"
    //     "const symbol = data.real_time_quotes[0].symbol;"
    //     "const lastPrice = data.real_time_quotes[0].last;"
    //     "const lastTime = data.real_time_quotes[0].last_time;"
    //     "// // // Encode data for NFT use"
    //     "const encoded = abiCoder.encode("
    //     "  [`string`, `string`, `string`],"
    //     "  [symbol, lastPrice, lastTime]"
    //     ");"
    //     "console.log(encoded);"
    //     "console.log('API response data:', JSON.stringify(data, null, 2));"
    //     "// Return the symbol from the real_time_quotes array"
    //     "// return Functions.encodeString(data.real_time_quotes[0].symbol);"
    //     "return ethers.getBytes(encoded);";
    // /////////////////////////////////////////
    // /////////////////////////////////////////
    // /////////////////////////////////////////
    // /////////////////////////////////////////
    // /////////////////////////////////////////
    // /////////////////////////////////////////
    //
    // string internal sourceCodeGetPrices =
    //     "// This function gets real-time quotes from Seeking Alpha. This example will showcase usage of HTTP requests and console.logs."
    //     "// 1, 2, 3 etc."
    //     "const saId = args[0]; // The SA ID for the request"
    //     "// Execute the API request (Promise)"
    //     "const apiResponse = await Functions.makeHttpRequest({"
    //     "  url: `https://seeking-alpha.p.rapidapi.com/market/get-realtime-quotes`,"
    //     "  params: { sa_ids: saId }, // Set the parameter for the SA ID"
    //     "  headers: {"
    //     "    'x-rapidapi-key': 'mXoswGhVcwmshI2rMojxtdAUtmd9p1fAuPgjsnvbmQIJRb3SXg',"
    //     "    'x-rapidapi-host': 'seeking-alpha.p.rapidapi.com'"
    //     "  }"
    //     "});"
    //     "if (apiResponse.error) {"
    //     "  console.error(apiResponse.error);"
    //     "  throw Error('Request failed');"
    //     "}"
    //     "const { data } = apiResponse;"
    //     "console.log('API response data:', JSON.stringify(data, null, 2));"
    //     "// Return the symbol from the real_time_quotes array"
    //     "return Functions.encodeString(data.real_time_quotes[0].symbol);";
}
