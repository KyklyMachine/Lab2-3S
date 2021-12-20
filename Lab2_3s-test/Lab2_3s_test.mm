//
//  Lab2_3s_test.m
//  Lab2_3s-test
//
//  Created by  Николай Фонов on 19.12.2021.
//

#import <XCTest/XCTest.h>
#include "BinaryTree.hpp"

@interface Lab2_3s_test : XCTestCase

@end

@implementation AVLTree: XCTestCase

- (void)testAdd {
    auto* tree = new BinaryTree<int>();
    
    tree->add(10);
    XCTAssertTrue(tree->exist(10));
    
    tree->add(1);
    XCTAssertTrue(tree->exist(1));
    XCTAssertTrue(tree->exist(10));
    
    tree->add(20);
    XCTAssertTrue(tree->exist(1));
    XCTAssertTrue(tree->exist(10));
    XCTAssertTrue(tree->exist(20));
    
    delete tree;
    
    
    auto* tree2 = new BinaryTree<int>();
    
    tree2->add(1);
    XCTAssertTrue(tree2->exist(1));
    
    tree2->add(2);
    XCTAssertTrue(tree2->exist(1));
    XCTAssertTrue(tree2->exist(2));
    
    tree2->add(3);
    XCTAssertTrue(tree2->exist(1));
    XCTAssertTrue(tree2->exist(2));
    XCTAssertTrue(tree2->exist(3));
    
    delete tree2;
};

- (void)testDelete{
    auto* tree = new BinaryTree<int>();
    
    tree->add(10);
    tree->add(1);
    tree->add(20);
    
    tree->remove(1);
    XCTAssertFalse(tree->exist(1));
    XCTAssertTrue(tree->exist(10));
    XCTAssertTrue(tree->exist(20));
    
    tree->remove(10);
    XCTAssertFalse(tree->exist(1));
    XCTAssertFalse(tree->exist(10));
    XCTAssertTrue(tree->exist(20));
    
    tree->remove(20);
    XCTAssertFalse(tree->exist(1));
    XCTAssertFalse(tree->exist(10));
    XCTAssertFalse(tree->exist(20));
    
    delete tree;
    
    
    auto* tree2 = new BinaryTree<int>();
    
    tree2->add(1);
    tree2->add(2);
    tree2->add(3);
    
    tree2->remove(1);
    XCTAssertFalse(tree2->exist(1));
    XCTAssertTrue(tree2->exist(2));
    XCTAssertTrue(tree2->exist(3));
    
    tree2->remove(2);
    XCTAssertFalse(tree2->exist(1));
    XCTAssertFalse(tree2->exist(2));
    XCTAssertTrue(tree2->exist(3));
    
    tree2->remove(3);
    XCTAssertFalse(tree2->exist(1));
    XCTAssertFalse(tree2->exist(2));
    XCTAssertFalse(tree2->exist(3));
    
    delete tree2;
};

- (void)testBalance{
    auto* tree = new BinaryTree<int>();
    
    tree->add(10);
    tree->add(1);
    tree->add(20);
    XCTAssert(tree->depth() == 2);
    
    tree->add(24);
    XCTAssert(tree->depth() == 3);
    
    tree->add(2);
    XCTAssert(tree->depth() == 3);
    
    delete tree;
    
    
    auto* tree2 = new BinaryTree<int>();
    
    tree2->add(1);
    tree2->add(2);
    tree2->add(3);
    XCTAssert(tree2->depth() == 2);
    
    tree2->add(4);
    XCTAssert(tree2->depth() == 3);
    
    tree2->add(5);
    XCTAssert(tree2->depth() == 3);
    
    delete tree2;
};

- (void)testGetCountNodes{
    auto* tree = new BinaryTree<int>();
    
    tree->add(10);
    XCTAssert(tree->getCountNodes() == 1);
    
    tree->add(1);
    XCTAssert(tree->getCountNodes() == 2);
    
    tree->add(20);
    XCTAssert(tree->getCountNodes() == 3);
    
    tree->add(24);
    XCTAssert(tree->getCountNodes() == 4);
    
    tree->add(2);
    XCTAssert(tree->getCountNodes() == 5);
    
    delete tree;
    
    
    auto* tree2 = new BinaryTree<int>();
    
    tree2->add(1);
    XCTAssert(tree2->getCountNodes() == 1);
    
    tree2->add(2);
    XCTAssert(tree2->getCountNodes() == 2);
    
    tree2->add(3);
    XCTAssert(tree2->getCountNodes() == 3);
    
    tree2->add(4);
    XCTAssert(tree2->getCountNodes() == 4);
    
    tree2->add(5);
    XCTAssert(tree2->getCountNodes() == 5);
    
    delete tree2;
};

- (void)testUnionTree{
    auto* tree = new BinaryTree<int>();
    tree->add(10);
    tree->add(1);
    tree->add(20);
    tree->add(24);
    tree->add(2);
    
    auto* tree2 = new BinaryTree<int>();
    tree2->add(1);
    tree2->add(2);
    tree2->add(3);
    tree2->add(4);
    tree2->add(5);
    
    auto* tree3 = tree->unionTree(tree2);
    
    XCTAssert(tree3->exist(1) == 1);
    XCTAssert(tree3->exist(2) == 1);
    XCTAssert(tree3->exist(3) == 1);
    XCTAssert(tree3->exist(4) == 1);
    XCTAssert(tree3->exist(5) == 1);
    XCTAssert(tree3->exist(10) == 1);
    XCTAssert(tree3->exist(20) == 1);
    XCTAssert(tree3->exist(24) == 1);
    
    delete tree;
    delete tree2;
    delete tree3;
};

- (void)testIntersecTree{
    auto* tree = new BinaryTree<int>();
    tree->add(10);
    tree->add(1);
    tree->add(20);
    tree->add(24);
    tree->add(2);
    
    auto* tree2 = new BinaryTree<int>();
    tree2->add(1);
    tree2->add(2);
    tree2->add(3);
    tree2->add(4);
    tree2->add(5);
    
    auto* tree3 = tree->intersecTree(tree2);
    
    XCTAssert(tree3->exist(1) == 1);
    XCTAssert(tree3->exist(2) == 1);
    XCTAssert(tree3->exist(3) == 0);
    XCTAssert(tree3->exist(4) == 0);
    XCTAssert(tree3->exist(5) == 0);
    XCTAssert(tree3->exist(10) == 0);
    XCTAssert(tree3->exist(20) == 0);
    XCTAssert(tree3->exist(24) == 0);
    
    delete tree;
    delete tree2;
    delete tree3;
};

- (void)testExcept{
    auto* tree = new BinaryTree<int>();
    tree->add(10);
    tree->add(1);
    tree->add(20);
    tree->add(24);
    tree->add(2);
    
    auto* tree2 = new BinaryTree<int>();
    tree2->add(1);
    tree2->add(2);
    tree2->add(3);
    tree2->add(4);
    tree2->add(5);
    
    auto* tree3 = tree->except(tree2);
    
    XCTAssert(tree3->exist(1) == 0);
    XCTAssert(tree3->exist(2) == 0);
    XCTAssert(tree3->exist(3) == 0);
    XCTAssert(tree3->exist(4) == 0);
    XCTAssert(tree3->exist(5) == 0);
    XCTAssert(tree3->exist(10) == 1);
    XCTAssert(tree3->exist(20) == 1);
    XCTAssert(tree3->exist(24) == 1);
    
    delete tree;
    delete tree2;
    delete tree3;
};
@end
