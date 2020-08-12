# Decoin Wallet API Documentation  
<br/>

**JSON-RPC API Setup**  
Before starting Decoin Wallet, make sure to create DECOIN.conf file in your Decoin data directory folder, In Linux it can be found at $HOME/.DECOIN/
**DECOIN.conf Configuration File**
All command-line options (except for -conf) may be specified in a configuration file, and all configuration file options may also be specified on the command line. Command-line options override values set in the configuration file.

The configuration file is a list of setting=value pairs, one per line, with optional comments starting with the '#' character.

The configuration file is not automatically created; you can create it using your favorite plain-text editor. A user-friendly configuration file generator is available here. By default, Decoin will look for a file named 'DECOIN.conf' in the decoin data directory, but both the data directory and the configuration file path may be changed using the -datadir and -conf command-line arguments.

| Operating System |Default decoin datadir|Typical path to configuration file  
| ------------- | ------------- |-------------|
| Windows | %APPDATA%\DECOIN\ | C:\Users\username\AppData\Roaming\DECOIN\DECOIN.conf
| Linux | $HOME/.DECOIN/ | /home/username/.DECOIN/DECOIN.conf
| Mac | $HOME/Library/Application Support/DECOIN/	 | /Users/username/Library/Application Support/DECOIN/DECOIN.conf



**Sample Decoin.conf**  
See here: [DECOIN](doc/DECOIN.conf)

## EndPoints 

### Add Multisig Address
Add a nrequired-to-sign multisignature address to the wallet. Each key is a decoin address or hex-encoded public key. If [account] is specified, assign address to [account]. Returns a string containing the address.	

     addmultisigaddress

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| nrequired | YES | The number of required signatures out of the n keys or addresses
| keys | YES | A json array of decoin addresses.
| account | NO | An account to assign the addresses to.

### Backup Wallet
Safely copies wallet.dat to destination, which can be a directory or a path with filename.

     backupwallet

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| destination | YES | destination can be a directory or a path with filename

### Create Raw Transaction
Creates a raw transaction spending given inputs.

     createrawtransaction

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| [{"txid":txid,"vout":n},...]{address:amount,...} | YES | array of objects containing transaction id and output number),sending to given address(es).

### Decode Raw Transaction
Produces a human-readable JSON object for a raw transaction.

     decoderawtransaction
   
**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| hex string | YES | The transaction hex string
   
### Dump Private Key
Reveals the private key corresponding to <decoinaddress>

     dumpprivkey

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| decoinaddress | YES | address of an account/accounts.

### Dump Wallet
Exports all wallet private keys to file

     dumpwallet

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| filename | YES | File name for storing private keys.

### Encrypt Wallet
Encrypts the wallet with <passphrase>.

     encryptwallet

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| passphrase | YES | The pass phrase to encrypt the wallet with. It must be at least 1 character, but should be long.

### Get Account
Returns the account associated with the given address.

     getaccount

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| decoinaddress | YES | The decoin address

### Get Account Address
Returns the current decoin address for receiving payments to this account. If <account> does not exist, it will be created along with an associated new address that will be returned.

     getaccountaddress

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| account | YES | The account name for the address.It can also be set to the empty string "" to represent the default account.

### Get Addresses By Account
Returns the list of addresses for the given account.

     getaddressesbyaccount

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| account | YES | The account name.

### Get Balance
If [account] is not specified, returns the server's total available balance.
If [account] is specified, returns the balance in the account.

     getbalance

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| account | NO | The account string may be given as a specific account name to find the balance associated with wallet keys
| minconf | NO | (default=1) Only include transactions confirmed at least this many times

### Get Best Block Hash
Returns the hash of the best (tip) block in the longest block chain.

     getbestblockhash

### Get Block
Returns information about the block with the given hash.

     getblock

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| hash | YES | The block hash

### Get Block Count
Returns the number of blocks in the longest block chain.

     getblockcount

### Get Block Hash
Returns hash of block in best-block-chain at <index>; index 0 is the genesis block

     getblockhash

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| index | YES | The height index (position of hash)

### Get Block Template
Returns data needed to construct a block to work on.

     getblocktemplate

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| Params | NO | Some optional params

### Get Connection Count
Returns the number of connections to other nodes.

     getconnectioncount

### Get Difficulty
Returns the proof-of-work difficulty as a multiple of the minimum difficulty.

     getdifficulty

### Get Info
Returns an object containing various state info.

     getinfo

### Get Mining Info
Returns an object containing mining-related information:
1 - blocks
2 - currentblocksize
3 - currentblocktx
4 - difficulty
5 - errors
6 - generate
7 - genproclimit
8 - hashespersec
9 - pooledtx
10 - testnet

     getmininginfo

### Get New Address
Returns a new decoin address for receiving payments. If [account] is specified payments received with the address will be credited to [account].

     getnewaddress

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| account | NO | The account name.

### Get Peer Info
Returns data about each connected node.

     getpeerinfo

### Get Raw Memory Pool
Returns all transaction ids in memory pool

     getrawmempool

### Get Raw Transaction
Returns raw transaction representation for given transaction id.

     getrawtransaction

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| txid | YES | The transaction id.
| verbose | NO | (default=false) If false, return a string, otherwise return a json object.

### Get Received By Account
Returns the total amount received by addresses with [account] in transactions with at least [minconf] confirmations. If [account] not provided return will include all transactions to all accounts.

     getreceivedbyaccount

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| account | YES | The account name.
| minconf | NO | (default=1) Only include transactions confirmed at least this many times.

### Get Received By Address
Returns the amount received by <decoinaddress> in transactions with at least [minconf] confirmations. It correctly handles the case where someone has sent to the address in multiple transactions. Keep in mind that addresses are only ever used for receiving transactions. Works only for addresses in the local wallet, external addresses will always show 0.

     getreceivedbyaddress

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| decoinaddress | YES | The decoin address.
| minconf | NO | (default=1) Only include transactions confirmed at least this many times.

### Get Transaction
Returns an object about the given transaction containing:
"amount" : total amount of the transaction
"confirmations" : number of confirmations of the transaction
"txid" : the transaction ID
"time" : time associated with the transaction[1].
"details" - An array of objects containing:
"account"
"address"
"category"
"amount"
"fee"

     gettransaction

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| txid | YES | The transaction ID.

### Get Work
If [data] is not specified, returns formatted hash data to work on:
"midstate" : precomputed hash state after hashing the first half of the data
"data" : block data
"hash1" : formatted hash buffer for second hash
"target" : little endian hash target
If [data] is specified, tries to solve the block and returns true if it was successful.

     getwork

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| data | NO | The block data.

### Get Help
List commands, or get help for a command.

     help

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| command | NO | The specific command.

### Import Private Key
Adds a private key (as returned by dumpprivkey) to your wallet. This may take a while, as a rescan is done, looking for existing transactions. Optional [rescan] parameter added in 0.8.0. Note: There's no need to import public key, as in ECDSA (unlike RSA) this can be computed from private key.

     importprivkey

**Parameters:**
  
|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| decoinprivkey | YES | The private key.
| label | NO | An optional label.
| rescan | NO | (default=true) Rescan the wallet for transactions.
    
### Keypool Refill
Fills the keypool, requires wallet passphrase to be set.

     keypoolrefill
### List Address Groupings
Returns all addresses in the wallet and info used for coincontrol.

     listaddressgroupings
    
### List Received By Address
Returns an array of objects containing:
"address" : receiving address
"account" : the account of the receiving address
"amount" : total amount received by the address
"confirmations" : number of confirmations of the most recent transaction included

     listreceivedbyaddress

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| minconf | NO | (default=1) Only include transactions confirmed at least this many times.
| includeempty | NO | (default=false) Whether to include accounts that haven't received any payments.
     
### List Since Block
Get all transactions in blocks since block [blockhash], or all transactions if omitted. [target-confirmations] intentionally does not affect the list of returned transactions, but only affects the returned "lastblock" value.

     listsinceblock

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| blockhash | NO | The block hash to list transactions since.
| target-confirmations | NO | (default=1) Return the nth block hash from the main chain.
   
### List Transactions
Returns up to [count] most recent transactions skipping the first [from] transactions for account [account]. If [account] not provided it'll return recent transactions from all accounts.

     listtransactions

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| account | NO | The account name.
| count | NO | (default=10) Most recent transactions.
| from | NO | (default=0) The number of transactions to skip.
   
### Move Account
Move from one account in your wallet to another.

     move

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| fromaccount | YES | The sender account.
| toaccount | YES | The destination account.
| amount | YES | The specific amount to be sent.
| minconf | NO | (default=1) Only include transactions confirmed at least this many times.
| comment | NO | comment.

### Send From Account
<amount> is a real and is rounded to 8 decimal places. Will send the given amount to the given address, ensuring the account has a valid balance using [minconf] confirmations. Returns the transaction ID if successful (not in JSON object).

     sendfrom

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| fromaccount | YES | The sender account name.
| todecoinaddress | YES | The destination account address.
| amount | YES | The specific amount to be sent.
| minconf | NO | (default=1) Only include transactions confirmed at least this many times.
| comment | NO | comment.
| comment-to | NO | An optional comment to store the name of the person or organization.
   
### Send Many
amounts are double-precision floating point numbers

     sendmany

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| fromaccount | YES | The sender account name.
| amounts | YES | A json object with addresses and amounts.
| minconf | NO | (default=1) Only include transactions confirmed at least this many times.
| comment | NO | comment.
    
### Send Raw Transaction
Submits raw transaction (serialized, hex-encoded) to local node and network.

     sendrawtransaction

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| hexstring | YES | The hex string of the raw transaction.

### Send To Address
<amount> is a real and is rounded to 8 decimal places. Returns the transaction ID <txid> if successful.

     sendtoaddress

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| decoinaddress | YES | The decoin address.
| amount | YES | The specific amount.
| comment | NO | A comment used to store what the transaction is for.
| comment-To | NO | An optional comment.

### Set Account
Sets the account associated with the given address. Assigning address that is already assigned to the same account will create a new address associated with that account.

     setaccount

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| decoinaddress | YES | The decoin address.
| account | YES | The account name.

### Set Transaction Fee
<amount> is a real and is rounded to the nearest 0.00000001

     settxfee

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| amount | YES | The transaction amount.

### Sign Message
Sign a message with the private key of an address.

     signmessage

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| decoinaddress | YES | The decoin address.
| message | YES | A message.

### Sign Raw Transaction
Adds signatures to a raw transaction and returns the resulting raw transaction.	

     signrawtransaction

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| hexstring | YES | The transaction hex string.
| prevtxs | NO | A json array of previous dependent transaction outputs.
| privkeys | NO | A json array of base58-encoded private keys for signing.

### Submit Block
Attempts to submit new block to network.

     submitblock

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| hex data | YES | The hex data.
| optional-params-obj | NO | An optional object.

### Validate Address
Return information about <decoinaddress>.

     validateaddress

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| decoinaddress | YES | The decoin address.

### Verify Message
Verify a signed message.

     verifymessage

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| decoinaddress | YES | The decoin address.
| signature | YES | The signature.
| message | YES | A message.

### Wallet Lock
Removes the wallet encryption key from memory, locking the wallet. After calling this method, you will need to call walletpassphrase again before being able to call any methods which require the wallet to be unlocked.

     walletlock

### Wallet Pass Phrase
Stores the wallet decryption key in memory for <timeout> seconds.

     walletpassphrase

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| passphrase | YES | The wallet passphrase.
| timeout | YES | The time to keep the decryption key in seconds.

### Wallet Pass Phrase Change
Changes the wallet passphrase from <oldpassphrase> to <newpassphrase>.

     walletpassphrasechange

**Parameters:**

|Name|Mandatory|Description  
| ------------- | ------------- |-------------|
| oldpassphrase | YES | The wallet old passphrase.
| newpassphrase | YES | The wallet new passphrase.