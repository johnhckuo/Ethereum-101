# Oracle Service
A service used to fetch real world data.

### Explanation

When we try to fetch data from real world data using API, the chain will repeat this operation until all the nodes receive the result.

However, it will be hard to achieve the consensus state of the whole network for various reasones like the temporarily unavailable of API service or the change of the query result.

So here comes the oracle service, which is a contract designed to fetch the real world data for all the nodes inside the chain, and send the copy of the value to each of the node in order to achieve consensus.

There are many oralce services like Oraclize, TinyOracle etc. In this example, we will use the version Oraclize proposed, which use the TLSNotary algorithm for the spirit of decentralization.

The following describe the underlying mechanism of the Oralize service.

![alt tag](https://docs.oraclize.it/images/flowchart.png)
Note: Currently, Oraclize support for both MainNet and TestNet (Testnet for free！) But if you want to use it in private net, `Ethereum-Bridge` will be a good starting point.

For further info, you can visit the official Oraclize document https://docs.oraclize.it/
and the api https://dev.oraclize.it/api.sol
