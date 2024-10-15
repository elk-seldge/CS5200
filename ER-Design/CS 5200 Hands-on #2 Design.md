# CS 5200 Hands-on #2: Design

<img src="C:\Users\DIONE\AppData\Roaming\Typora\typora-user-images\image-20231101191926468.png" alt="image-20231101191926468" style="zoom:150%;" />

## 2. (40pt) Transformation Process from ER model to Database Design

### (20pt) For each **entity,** describe the **transformation from an entity to a table**

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-3045&y=-311&w=1597&h=891&store=1&accept=image%2F*&auth=LCA%20873b1128d57b23a8f07a807c0099c4b09af69b489f4b2e1855c01f1ca91da028-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-3046&y=506&w=1597&h=2297&store=1&accept=image%2F*&auth=LCA%20054a8604e703a14bc35bf71d873882f8c685a08a2751826d3f4043d5121aaf54-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-3064&y=2721&w=1597&h=1139&store=1&accept=image%2F*&auth=LCA%20c5ef200237ec696141d897c0ed57c0ad13f54eb34b37a14ff31132dabefd4593-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-3068&y=3830&w=1597&h=1276&store=1&accept=image%2F*&auth=LCA%20b249cffc28f2ccf216dc73dacd66792ecc463fbd2ea931f8eea9b25ecf4f08e3-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-3064&y=5129&w=1597&h=964&store=1&accept=image%2F*&auth=LCA%20278538f6d44ef3c1fdee11eb00e99d05e2c2af561102504aca78d1398dcbebc9-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-3066&y=6108&w=1571&h=935&store=1&accept=image%2F*&auth=LCA%20db9f7acc1318e380abba221d6dcacc155c4f49efce3aef4454577b45bba2c974-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-3069&y=7064&w=1599&h=1192&store=1&accept=image%2F*&auth=LCA%206a1492741a3d08d47684675d448fe7d7831ee37c7f52dda3cad88c211a73ffd8-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-3067&y=8158&w=1597&h=969&store=1&accept=image%2F*&auth=LCA%20dc6447726d7e0c66d18efaf1807a0b722c20d397ffa6dc91bbf52185ae1cdbd0-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-3069&y=9068&w=1598&h=669&store=1&accept=image%2F*&auth=LCA%20eb4edab41c4a5b8b7f1f0611fe88ca149eb771d9f10d94887670d9fa2aaa7937-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-3066&y=9641&w=1571&h=1396&store=1&accept=image%2F*&auth=LCA%20a89a735a3c8a44dedb20993425ca8f0664f3a331ab4e6fdda091875ccb565bad-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-3066&y=10962&w=1571&h=719&store=1&accept=image%2F*&auth=LCA%203fee50d760571638cb6c3d4dd749a4af8712be5c3b534f84bf817c114c3c84d1-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-3068&y=11641&w=1571&h=962&store=1&accept=image%2F*&auth=LCA%20376efcb26312aff014c84d61ce2af95b9010e3890e8e276798f28035c8588348-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-3067&y=12554&w=1571&h=957&store=1&accept=image%2F*&auth=LCA%20e685fffb9ca43f0d154b70be9f6b1739cb87b44b1e011e9f559866f02819456b-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-3067&y=13425&w=1597&h=1360&store=1&accept=image%2F*&auth=LCA%205dea18adb24c74ce7f4b7fca774cfeb526fb77c67e2a67abbc1105e000d25727-ts%3D1699312550)

### (20pt) For each **relationship,** 1) present a **relationship between entities** to a **relationship between tables** in the UML format and then

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-888&y=-377&w=1451&h=1464&store=1&accept=image%2F*&auth=LCA%20b3cbbcb21f569a6b544e5b8242543901c4f8e689b4787c1731c98caef0a4f80b-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-888&y=950&w=1451&h=1604&store=1&accept=image%2F*&auth=LCA%20c283bd35f710cf077094c8f312abfd806e8d5c6ae0eb0f39aadf4f3e4f616f4f-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-929&y=2470&w=1943&h=1222&store=1&accept=image%2F*&auth=LCA%20b6e356b6a991e0ee64902b343b93ed289d0b8dabf328aff184e4848f52ec4882-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-921&y=3569&w=1559&h=1546&store=1&accept=image%2F*&auth=LCA%2060d0d065118a27851067cb84624a7788be7a4e8deb429ca13a7945a5933cf830-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-900&y=5022&w=1317&h=1214&store=1&accept=image%2F*&auth=LCA%20ffd008f1eaac9dde64ba18af5ef3d9226224420efd4d382c97e36ebd2d45f5b9-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-907&y=6111&w=1251&h=1390&store=1&accept=image%2F*&auth=LCA%20ad5aad0a9564f157f6f37a6eca5782ecc5665ad0ddb2a702fcfc9a4fb1a96cf5-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-982&y=7394&w=2032&h=1403&store=1&accept=image%2F*&auth=LCA%20a16a2d7d3110dce113d65fa8a36221d0eecdf5bc5511aa02d4e4c4afdef84b1f-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-912&y=8650&w=1339&h=1324&store=1&accept=image%2F*&auth=LCA%20ea6e1c0a49bf13688092031c05e0b6bd67d048779c0b34a1211e4f501a17d5ee-ts%3D1699312550)

 ![img](https://documents.lucid.app/documents/6ff50f6c-abe7-49af-9f95-6e24387f9af1/pages/0_0?a=3773&x=-917&y=9844&w=1455&h=1491&store=1&accept=image%2F*&auth=LCA%20f38120947f76d7567ffc88d6ee15e7f12c208d1d94a8dc5d3d7f0a2b27202bd2-ts%3D1699312550)

## 3. (10pt) Database Design 

![image-20231108145806170](C:\Users\DIONE\AppData\Roaming\Typora\typora-user-images\image-20231108145806170.png)