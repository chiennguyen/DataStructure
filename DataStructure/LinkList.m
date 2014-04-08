//
//  LinkList.m
//  DataStructure
//
//  Created by CHIEN NGUYEN on 4/8/14.
//  Copyright (c) 2014 CHIEN NGUYEN. All rights reserved.
//

#import "LinkList.h"
#import "Node.h"


@implementation LinkList
{
    Node *head;
}

//========================== add to link list =============================
/** Insert node at begin of the list
 *
 */
-(void)addBegin:(id) data
{
    Node* node = [[Node alloc]init];
    [node setData:data];
    
    //list is empty
    if(head == nil)
    {
        head = node;
        [node setNext:nil];
    }
    else
    {
        [node setNext:head];
        head=node;
    }
}

/** Insert node at end of the list
 *
 */
-(void)addEnd:(id)data
{
    Node* node = [[Node alloc]init];
    [node setData:data];
    
    //this node use to traverse the list
    Node *traverseNode = head;
    
    if(head == nil)
    {
        head = node;
        [node setNext:nil];
    }
    else
    {
        //travserse down to the end of the list
        while(traverseNode.next!=nil)
            traverseNode = traverseNode.next;
        
        //append at the end of the list
        [node setNext:nil];
        traverseNode.next = node;
    
    }
}

/** Insert node at given location
 *
 */
-(void)addAt:(int)location setData:(id)data
{
    Node *prevNode, *curNode;
    curNode = head;
    
    if(location>[self count]+1 || location<=0)
    {
        NSLog(@"Insertion at given location is not possible");
    }
    else
    {
        if(location==1)
        {
            [self addBegin:data];
        }
        else
        {
            //look for the add location
            for(int i=1; i<location; i++)
            {
                prevNode = curNode;
                curNode = curNode.next;
            }
            
            Node* node = [[Node alloc]init];
            [node setData:data];
            
            //insert data to given location
            prevNode.next = node;
            node.next = curNode;
        }
    }
}

//============================== delete data in link list ===============================

/** Delete a node base on given data. This method delete the first data that match given data
 *
 */
-(BOOL)deleteNodeData:(id)data
{
    Node *prevNode, *curNode;
    curNode = head;
    
    //traverse down the list
    while (curNode!=nil)
    {
        //found data
        if(curNode.data==data)
        {
            if(curNode == head)
            {
                head = curNode.next;
                curNode = nil;
                return YES;
            }
            else
            {
                prevNode.next = curNode.next;
                curNode = nil;
                return YES;
            }
        }
        else//data not found, continue traverse down the list
        {
            prevNode = curNode;
            curNode = curNode.next;
        }
    }
    
    NSLog(@"Element not found in the list!!");
    return NO;
}

/** Delete node at given position
 */
-(BOOL)deleteNodeAtLocation:(int)location
{
    Node *prevNode, *curNode;
    curNode = head;
    
    if(location>[self count]+1 || location<=0)
    {
        NSLog(@"Deletion at given location is not possible");
    }
    else
    {
        if(location==1)
        {
            head = curNode.next;
            curNode = nil;
            return YES;
        }
        else
        {
            //look for the add location
            for(int i=1; i<location; i++)
            {
                prevNode = curNode;
                curNode = curNode.next;
            }
            prevNode.next = curNode.next;
            curNode=nil;
            return YES;
        }
    }
    
    return NO;
    
}

//============== reverse link list ==================
-(void)reverseList
{
    Node *curNode, *prevNode, *tempNode;
    
    curNode = head;
    prevNode=nil;
    
    //traverse the list
    while(curNode!=nil)
    {
        NSLog(curNode.data);
        tempNode = prevNode;
        prevNode = curNode;
        //traverse the list
        curNode = curNode.next;
        
        prevNode.next = tempNode;
        
    }
    head = prevNode;
}


/** Count the length ot the list
 */
-(int)count
{
    Node *currentPointer = head;
    int count=0;
    
    while (currentPointer!=nil)
    {
        currentPointer = currentPointer.next;
        count++;
    }
    
    return count;
}














@end
