# Encrypted-Data-Reader-FPGA

Encrypted Data Reader

![Encrypted_Data_Reader_Block_Diagram](https://user-images.githubusercontent.com/10440980/216784271-43bf33ba-6d61-4382-9846-ca87016fcf62.png)

I Designed Simple Encrypted Data Reader.
## 1.How it Works ?
Firstly we assume that we have simple cyrptology system for our data. Every data block occurs from 10 bits.
We split into three part our data block;

->Starting Part

->Data

->Ending Part

And we split into two part our All datas;

->Original Data

->Conjugate Data

### 1.1.Starting Part
Both of Our Orijinal and Conjugate Datas occurs from '001' Starting Bits.
### 1.2.Data 
Difference between original and conjugate data occurs from here.When we send 4 Bit Real Data by using Data Block called Orijinal Data, We send bits by bits conjugate Data by using Conjugate Data.
### 1.3.Ending Part
Both of Our Original and Conjugate Datas occurs from '100' Ending Bits.


## 2.How to Produce Output Pure Data ?
First of All, we Dealing with Starting and Ending part of Both of Original and Conjugate Data. If Starting Bits start with '001' for both of them , and also If Ending Bits start with '100' and Both Condition satisfy, we can say that Our Data Blocks are matched. However, we also need to check content of datas.Conjugate data HAVE TO keep bit by bit reverse of the Real Data.

Secondly, If you be careful when looking to Pure Data Part, There is '1' start of the Data ('1ABCD) , That bit represent both condition that mentioned above are satisfied. Otherwise Tihs bit will be equal to zero and Don't process other data into the output bits. 
Summmary _ABCD  if first part Equal to 0 ==> Output will be '000000' because our data is not received clearly.
On the other hands, if Everything is perfect and We can read data clearly, Our data sart will '1' and its values 'ABCD' will written into the output and its look like '1ABCD'

## 3.Some Examples For Better Understanding

### 3.1 Example 1

Original Data  = 0011101100
Conjugate Data = 0010010100
Pure Data      = 11101

Let's Explain.

Split the Original Data  => 001 - 1101 - 100

Split the Conjugate Data => 001 - 0010 - 100

Starting and Ending Bits are Matched !
Pure and Conjgate Data ara Matched ! 

Starting Bit = 1
Data Bits     = 1101

Result ;
    Pure Data = 11101
    
Testbench : data_encryption_tb

![testbench 1](https://user-images.githubusercontent.com/10440980/216785569-49e41226-3f46-41bc-aa90-5cd34eaa66e5.png)


### 3.2 Example 2

Original Data  = 0010001100
Conjugate Data = 0010010100
Pure Data      = 00000

Let's Explain.

Split the Original Data  => 001 - 0001 - 100

Split the Conjugate Data => 001 - 0010 - 100

Starting and Ending Bits are Matched !
Pure and Conjgate Data ara not Matched ! 

Starting Bit = 0
Data Bits     = 0001

Result ;
    Pure Data = 000000
    
Testbench : data_encryption_tb_2    

![testbench 2](https://user-images.githubusercontent.com/10440980/216785884-10f6400d-1eec-4cc7-850f-55736acf14b5.png)
