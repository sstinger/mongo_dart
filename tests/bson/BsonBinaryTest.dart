#library("bsonbinarytest");
#import('../../third_party/testing/unittest/unittest_vm.dart');
#import("../../lib/bson/bson.dart");
testByteArrayNegativeWrite(){
  ByteArray ba = new ByteArray(4);
  ba.setInt32(0,-1);
  Expect.listEquals(ba,[255,255,255,255]);
  expect(ba).equalsCollection([255,255,255,255]);
}
testBinaryWithNegativeOne(){
  Binary b = new Binary(4);
  b.writeInt(-1);   
  expect(b.toHexString()).equals('ffffffff');  
}
testBinary(){
   Binary b = new Binary(8);
   b.writeInt(0,4);
   b.writeInt(1,4);
   Expect.equals(b.toHexString(),'0000000001000000');   
   b = new Binary(8);
   b.writeInt(0,4);
   b = new Binary(8);
   b.writeInt(0,4);
   b.writeInt(0x01020304,4);
   Expect.equals(b.toHexString(),'0000000004030201');
   b = new Binary(8);
   b.writeInt(0,4);
   b.writeInt(0x01020304,4,forceBigEndian:true);
   Expect.equals(b.toHexString(),'0000000001020304');
   b = new Binary(8);
   b.writeInt(0,4);
   b.writeInt(1,4,forceBigEndian:true);   
   Expect.equals(b.toHexString(),'0000000000000001');   
   b = new Binary(8);   
   b.writeInt(1,3,forceBigEndian:true);
   Expect.equals('0000010000000000',b.toHexString());
   b = new Binary(8);
   b.writeInt(0,3);
   b.writeInt(1,3,forceBigEndian:true);
   Expect.equals('0000000000010000',b.toHexString());
   b = new Binary(4);
   b.writeInt(-1);   
   expect(b.toHexString()).equals('ffffffff');
   b = new Binary(4);
   b.writeInt(-100);   
   expect(b.toHexString()).equals('9cffffff');   
}

main(){
  group("BSonBinary:", (){
    test("testByteArrayNegativeWrite",testByteArrayNegativeWrite);
    test("testBinary",testBinary);
    test("testBinaryWithNegativeOne",testBinaryWithNegativeOne);    
  });
}