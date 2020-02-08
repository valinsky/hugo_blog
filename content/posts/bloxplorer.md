---
title: Bloxplorer
date: 2020-02-08T10:49:18-05:00
draft: false
description: Bloxplorer
keywords: bloxplorer, open source, python
url: /posts/bloxplorer/
toc: false
images:
  - /images/bloxplorer/bitcoin.png
images:
tags:
  - bloxplorer
  - open source
  - python
---

In this post I want to introduce [Bloxplorer](https://github.com/valinsky/bloxplorer), a simple yet very effective Bitcoin and Liquid blockchain explorer I wrote in Python.

Bloxplorer - short for Block Explorer - is an open source package that allows developers to make use of the full power of the [Blockstream Esplora HTTP API](https://github.com/Blockstream/esplora/blob/master/API.md) through a clean Python interface.

### Why I wrote Bloxplorer

I'm fascinated with Bitcoin, both from a technological and an economical standpoint, and with the ever growing pieces of tech surrounding it, like [Lighting Network](https://lightning.network/), [Schnorr and Taproot](https://bitcoinmagazine.com/articles/taproot-coming-what-it-and-how-it-will-benefit-bitcoin) to name a few.

While reading through Jimmy Songs [Programming Bitcoin](https://github.com/jimmysong/programmingbitcoin) book, I wanted to use the knowledge that I gained to play around with the Bitcoin blockchain using Python. I soon found out that there was no package that did what I was looking for. This was a great opportunity for me to build my first open source project that I can share with the community and to help grow the Bitcoin ecosystem, even if just by a tiny bit.

What I wanted to achieve was the simplest way a Python engineer can interact with the Bitcoin blockchain.

I chose Blockstreams Esplora as the underlying API because Blockstream has been succesfully involved in growing the Bitcoin ecosystem for years, and also because the [Liquid sidechain](https://blockstream.com/liquid/) is available in the same API.

### Usage

Bloxplorer is a Python block explorer for Bitcoin, Liquid and Bitcoin Testnet. It offers all the necessary tools an engineer needs in order to interact with the specific blockchain in a simple and straightforward manner.

The methods exposed by the package are organized into 6 categories: Addresses, Transactions, Blocks, Fees, Mempool and Assets. Assets is available only for Liquid.

For example, if you want to get information about a specific Bitcoin address, you can do it like so:

```python
from bloxplorer import bitcoin_explorer as explorer

result = explorer.addr.get('147SwRQdpCfj5p8PnfsXV2SsVVpVcz3aPq')
print(result.data)

"""
{
  'address': '147SwRQdpCfj5p8PnfsXV2SsVVpVcz3aPq',
  'chain_stats':
  {
    'funded_txo_count': 1237,
    'funded_txo_sum': 1583994506803,
    'spent_txo_count': 1230, 'spent_txo_sum': 1575155902037,
    'tx_count': 1701
  },
  'mempool_stats':
  {
    'funded_txo_count': 0,
    'funded_txo_sum': 0,
    'spent_txo_count': 0,
    'spent_txo_sum': 0,
    'tx_count': 0
  }
}
"""
```

You can also get details about a specific transaction:

```python
from bloxplorer import bitcoin_explorer as explorer

result = explorer.tx.get('b3eb36873d61cfde5d3780195430fe23cf79ab4313bdd3834d6eb97e9f2e9c8c')
print(result.data)

"""
{
  'txid': 'b3eb36873d61cfde5d3780195430fe23cf79ab4313bdd3834d6eb97e9f2e9c8c',
  'version': 1,
  'locktime': 0,
  'vin': [
  {
      'txid': '0000000000000000000000000000000000000000000000000000000000000000',
      'vout': 4294967295,
      'prevout': None,
      'scriptsig': '03716809049f203f5efabe6d6d790aeab57d0c2c6db22acdf312204864aa6e0804d236bcfbf3193f216ac0aef8040000000000000008180052c2d7050000142f70726f68617368696e672e636f6d9b1d02002f',
      'scriptsig_asm': 'OP_PUSHBYTES_3 716809 OP_PUSHBYTES_4 9f203f5e OP_RETURN_250 OP_RETURN_190 OP_2DROP OP_2DROP OP_PICK OP_PUSHBYTES_10 eab57d0c2c6db22acdf3 OP_PUSHBYTES_18 204864aa6e0804d236bcfbf3193f216ac0ae OP_RETURN_248 OP_PUSHBYTES_4 00000000 OP_0 OP_0 OP_0 OP_PUSHBYTES_8 180052c2d7050000 OP_PUSHBYTES_20 2f70726f68617368696e672e636f6d9b1d02002f',
      'is_coinbase': True,
      'sequence': 0
  }],
  'vout': [
  {
    'scriptpubkey': '76a9143738752136c7b5deebbded93274d69c90d3b208f88ac',
    'scriptpubkey_asm': 'OP_DUP OP_HASH160 OP_PUSHBYTES_20 3738752136c7b5deebbded93274d69c90d3b208f OP_EQUALVERIFY OP_CHECKSIG',
    'scriptpubkey_type': 'p2pkh',
    'scriptpubkey_address': '162yoHmpvqCq5SztkKaiEd5LiPyxcPLYzu',
    'value': 1260049294
  }],
  'size': 168,
  'weight': 672,
  'status': 
  {
    'confirmed': True,
    'block_height': 616561,
    'block_hash': '00000000000000000002843470daa89c41da6f52ce968e91a45385202cc813c4',
    'block_time': 1581195408
  }
}
"""
```

You can also post your own transactions, check the current block height, see the mempool status and much more.

The full API documentation is available [here](https://valinsky.me/bloxplorer/index.html).

### Conclusion

With Bloxplorer I saw an opportunity to help the Bitcoin ecosystem while also getting my foot through the door of open source software and I'm very happy with the end result. At the time of this writing Bloxplorer was downloaded [more than 4k times](https://pepy.tech/project/bloxplorer/), which I think is amazing.

Feel free to play around with it and if interesented, I welcome you to submit PRs or to open issues on [GitHub](https://github.com/valinsky/bloxplorer).