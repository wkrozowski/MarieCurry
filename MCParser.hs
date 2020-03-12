{-# OPTIONS_GHC -w #-}
module MCParser where
import MCLexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,228) ([12288,8200,65508,0,512,61704,63,0,4,0,0,32260,63,0,0,0,0,0,0,1024,0,128,64578,15,8192,4224,74,0,8200,4740,0,0,0,1984,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,8200,65476,0,512,61704,63,32768,16896,4092,0,0,0,0,2096,58400,255,3072,2050,16377,0,1024,0,0,8192,0,0,0,8,0,0,128,0,0,0,0,1,49152,32800,65424,3,2048,50208,255,0,2050,16369,0,131,65090,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,50208,255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,8200,4740,0,512,41224,4,32768,16896,296,0,32800,18960,0,2048,33824,18,0,2050,1185,0,128,10306,1,8192,4224,74,0,8200,4740,0,512,41224,4,32768,16896,296,0,32800,18960,0,2048,33824,18,3072,2050,16377,0,0,0,0,0,11264,0,0,0,11,0,0,704,0,0,45056,0,0,0,44,0,0,2816,0,16384,61440,3,0,16,252,0,1024,16128,0,0,49153,15,0,64,1008,0,4096,64512,0,0,0,44,0,0,0,0,0,0,0,0,256,0,0,16384,0,0,0,4,0,0,512,0,0,0,0,61440,1,0,0,0,512,0,0,32768,0,0,0,4,0,0,0,0,0,0,16,0,0,128,0,0,8192,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Stmt","Selection_Stmt","Iteration_Stmt","Compound_Stmt","Expression","Operation","Exp2","Exception","Type","if","while","else","'='","'+'","'{'","'}'","'('","')'","':'","';'","'<'","'>'","'<='","'>='","'=='","'!='","'!'","'&&'","'||'","'/'","'*'","'-'","'%'","catch","try","throw","number","intT","bool","boolT","void","var","print","consume","streams","NullPointerException","StreamsNotInitialisedException","NotExistingStreamConsumptionException","DivideByZeroException","TrapException","%eof"]
        bit_start = st * 54
        bit_end = (st + 1) * 54
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..53]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (13) = happyShift action_23
action_0 (14) = happyShift action_24
action_0 (20) = happyShift action_6
action_0 (30) = happyShift action_7
action_0 (35) = happyShift action_8
action_0 (38) = happyShift action_25
action_0 (39) = happyShift action_9
action_0 (40) = happyShift action_10
action_0 (41) = happyShift action_11
action_0 (42) = happyShift action_12
action_0 (43) = happyShift action_13
action_0 (44) = happyShift action_14
action_0 (45) = happyShift action_15
action_0 (46) = happyShift action_16
action_0 (47) = happyShift action_17
action_0 (48) = happyShift action_18
action_0 (4) = happyGoto action_19
action_0 (5) = happyGoto action_20
action_0 (6) = happyGoto action_21
action_0 (8) = happyGoto action_22
action_0 (9) = happyGoto action_3
action_0 (10) = happyGoto action_4
action_0 (12) = happyGoto action_5
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (20) = happyShift action_6
action_1 (30) = happyShift action_7
action_1 (35) = happyShift action_8
action_1 (39) = happyShift action_9
action_1 (40) = happyShift action_10
action_1 (41) = happyShift action_11
action_1 (42) = happyShift action_12
action_1 (43) = happyShift action_13
action_1 (44) = happyShift action_14
action_1 (45) = happyShift action_15
action_1 (46) = happyShift action_16
action_1 (47) = happyShift action_17
action_1 (48) = happyShift action_18
action_1 (8) = happyGoto action_2
action_1 (9) = happyGoto action_3
action_1 (10) = happyGoto action_4
action_1 (12) = happyGoto action_5
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (23) = happyShift action_61
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (17) = happyShift action_48
action_3 (24) = happyShift action_49
action_3 (25) = happyShift action_50
action_3 (26) = happyShift action_51
action_3 (27) = happyShift action_52
action_3 (28) = happyShift action_53
action_3 (29) = happyShift action_54
action_3 (31) = happyShift action_55
action_3 (32) = happyShift action_56
action_3 (33) = happyShift action_57
action_3 (34) = happyShift action_58
action_3 (35) = happyShift action_59
action_3 (36) = happyShift action_60
action_3 _ = happyReduce_12

action_4 _ = happyReduce_34

action_5 (45) = happyShift action_47
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (20) = happyShift action_6
action_6 (30) = happyShift action_7
action_6 (35) = happyShift action_8
action_6 (39) = happyShift action_9
action_6 (40) = happyShift action_10
action_6 (41) = happyShift action_11
action_6 (42) = happyShift action_12
action_6 (43) = happyShift action_13
action_6 (44) = happyShift action_14
action_6 (45) = happyShift action_15
action_6 (46) = happyShift action_16
action_6 (47) = happyShift action_17
action_6 (48) = happyShift action_18
action_6 (8) = happyGoto action_46
action_6 (9) = happyGoto action_3
action_6 (10) = happyGoto action_4
action_6 (12) = happyGoto action_5
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (20) = happyShift action_6
action_7 (30) = happyShift action_7
action_7 (35) = happyShift action_8
action_7 (40) = happyShift action_10
action_7 (42) = happyShift action_12
action_7 (45) = happyShift action_44
action_7 (9) = happyGoto action_45
action_7 (10) = happyGoto action_4
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (20) = happyShift action_6
action_8 (30) = happyShift action_7
action_8 (35) = happyShift action_8
action_8 (40) = happyShift action_10
action_8 (42) = happyShift action_12
action_8 (45) = happyShift action_44
action_8 (9) = happyGoto action_43
action_8 (10) = happyGoto action_4
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (49) = happyShift action_38
action_9 (50) = happyShift action_39
action_9 (51) = happyShift action_40
action_9 (52) = happyShift action_41
action_9 (53) = happyShift action_42
action_9 (11) = happyGoto action_37
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_38

action_11 _ = happyReduce_45

action_12 _ = happyReduce_37

action_13 _ = happyReduce_44

action_14 _ = happyReduce_46

action_15 (16) = happyShift action_36
action_15 _ = happyReduce_36

action_16 (20) = happyShift action_6
action_16 (30) = happyShift action_7
action_16 (35) = happyShift action_8
action_16 (39) = happyShift action_9
action_16 (40) = happyShift action_10
action_16 (41) = happyShift action_11
action_16 (42) = happyShift action_12
action_16 (43) = happyShift action_13
action_16 (44) = happyShift action_14
action_16 (45) = happyShift action_15
action_16 (46) = happyShift action_16
action_16 (47) = happyShift action_17
action_16 (48) = happyShift action_18
action_16 (8) = happyGoto action_35
action_16 (9) = happyGoto action_3
action_16 (10) = happyGoto action_4
action_16 (12) = happyGoto action_5
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (20) = happyShift action_6
action_17 (30) = happyShift action_7
action_17 (35) = happyShift action_8
action_17 (39) = happyShift action_9
action_17 (40) = happyShift action_10
action_17 (41) = happyShift action_11
action_17 (42) = happyShift action_12
action_17 (43) = happyShift action_13
action_17 (44) = happyShift action_14
action_17 (45) = happyShift action_15
action_17 (46) = happyShift action_16
action_17 (47) = happyShift action_17
action_17 (48) = happyShift action_18
action_17 (8) = happyGoto action_34
action_17 (9) = happyGoto action_3
action_17 (10) = happyGoto action_4
action_17 (12) = happyGoto action_5
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (20) = happyShift action_6
action_18 (30) = happyShift action_7
action_18 (35) = happyShift action_8
action_18 (39) = happyShift action_9
action_18 (40) = happyShift action_10
action_18 (41) = happyShift action_11
action_18 (42) = happyShift action_12
action_18 (43) = happyShift action_13
action_18 (44) = happyShift action_14
action_18 (45) = happyShift action_15
action_18 (46) = happyShift action_16
action_18 (47) = happyShift action_17
action_18 (48) = happyShift action_18
action_18 (8) = happyGoto action_33
action_18 (9) = happyGoto action_3
action_18 (10) = happyGoto action_4
action_18 (12) = happyGoto action_5
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (54) = happyAccept
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (13) = happyShift action_23
action_20 (14) = happyShift action_24
action_20 (20) = happyShift action_6
action_20 (30) = happyShift action_7
action_20 (35) = happyShift action_8
action_20 (38) = happyShift action_25
action_20 (39) = happyShift action_9
action_20 (40) = happyShift action_10
action_20 (41) = happyShift action_11
action_20 (42) = happyShift action_12
action_20 (43) = happyShift action_13
action_20 (44) = happyShift action_14
action_20 (45) = happyShift action_15
action_20 (46) = happyShift action_16
action_20 (47) = happyShift action_17
action_20 (48) = happyShift action_18
action_20 (4) = happyGoto action_32
action_20 (5) = happyGoto action_20
action_20 (6) = happyGoto action_21
action_20 (8) = happyGoto action_22
action_20 (9) = happyGoto action_3
action_20 (10) = happyGoto action_4
action_20 (12) = happyGoto action_5
action_20 _ = happyReduce_5

action_21 (13) = happyShift action_23
action_21 (14) = happyShift action_24
action_21 (20) = happyShift action_6
action_21 (30) = happyShift action_7
action_21 (35) = happyShift action_8
action_21 (38) = happyShift action_25
action_21 (39) = happyShift action_9
action_21 (40) = happyShift action_10
action_21 (41) = happyShift action_11
action_21 (42) = happyShift action_12
action_21 (43) = happyShift action_13
action_21 (44) = happyShift action_14
action_21 (45) = happyShift action_15
action_21 (46) = happyShift action_16
action_21 (47) = happyShift action_17
action_21 (48) = happyShift action_18
action_21 (4) = happyGoto action_31
action_21 (5) = happyGoto action_20
action_21 (6) = happyGoto action_21
action_21 (8) = happyGoto action_22
action_21 (9) = happyGoto action_3
action_21 (10) = happyGoto action_4
action_21 (12) = happyGoto action_5
action_21 _ = happyReduce_6

action_22 (23) = happyShift action_30
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (20) = happyShift action_29
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (20) = happyShift action_28
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (18) = happyShift action_27
action_25 (7) = happyGoto action_26
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (37) = happyShift action_81
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (13) = happyShift action_23
action_27 (14) = happyShift action_24
action_27 (20) = happyShift action_6
action_27 (30) = happyShift action_7
action_27 (35) = happyShift action_8
action_27 (38) = happyShift action_25
action_27 (39) = happyShift action_9
action_27 (40) = happyShift action_10
action_27 (41) = happyShift action_11
action_27 (42) = happyShift action_12
action_27 (43) = happyShift action_13
action_27 (44) = happyShift action_14
action_27 (45) = happyShift action_15
action_27 (46) = happyShift action_16
action_27 (47) = happyShift action_17
action_27 (48) = happyShift action_18
action_27 (4) = happyGoto action_80
action_27 (5) = happyGoto action_20
action_27 (6) = happyGoto action_21
action_27 (8) = happyGoto action_22
action_27 (9) = happyGoto action_3
action_27 (10) = happyGoto action_4
action_27 (12) = happyGoto action_5
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (20) = happyShift action_6
action_28 (30) = happyShift action_7
action_28 (35) = happyShift action_8
action_28 (39) = happyShift action_9
action_28 (40) = happyShift action_10
action_28 (41) = happyShift action_11
action_28 (42) = happyShift action_12
action_28 (43) = happyShift action_13
action_28 (44) = happyShift action_14
action_28 (45) = happyShift action_15
action_28 (46) = happyShift action_16
action_28 (47) = happyShift action_17
action_28 (48) = happyShift action_18
action_28 (8) = happyGoto action_79
action_28 (9) = happyGoto action_3
action_28 (10) = happyGoto action_4
action_28 (12) = happyGoto action_5
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (20) = happyShift action_6
action_29 (30) = happyShift action_7
action_29 (35) = happyShift action_8
action_29 (39) = happyShift action_9
action_29 (40) = happyShift action_10
action_29 (41) = happyShift action_11
action_29 (42) = happyShift action_12
action_29 (43) = happyShift action_13
action_29 (44) = happyShift action_14
action_29 (45) = happyShift action_15
action_29 (46) = happyShift action_16
action_29 (47) = happyShift action_17
action_29 (48) = happyShift action_18
action_29 (8) = happyGoto action_78
action_29 (9) = happyGoto action_3
action_29 (10) = happyGoto action_4
action_29 (12) = happyGoto action_5
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (13) = happyShift action_23
action_30 (14) = happyShift action_24
action_30 (20) = happyShift action_6
action_30 (30) = happyShift action_7
action_30 (35) = happyShift action_8
action_30 (38) = happyShift action_25
action_30 (39) = happyShift action_9
action_30 (40) = happyShift action_10
action_30 (41) = happyShift action_11
action_30 (42) = happyShift action_12
action_30 (43) = happyShift action_13
action_30 (44) = happyShift action_14
action_30 (45) = happyShift action_15
action_30 (46) = happyShift action_16
action_30 (47) = happyShift action_17
action_30 (48) = happyShift action_18
action_30 (4) = happyGoto action_62
action_30 (5) = happyGoto action_20
action_30 (6) = happyGoto action_21
action_30 (8) = happyGoto action_22
action_30 (9) = happyGoto action_3
action_30 (10) = happyGoto action_4
action_30 (12) = happyGoto action_5
action_30 _ = happyReduce_2

action_31 _ = happyReduce_4

action_32 _ = happyReduce_3

action_33 _ = happyReduce_17

action_34 _ = happyReduce_16

action_35 _ = happyReduce_15

action_36 (20) = happyShift action_6
action_36 (30) = happyShift action_7
action_36 (35) = happyShift action_8
action_36 (39) = happyShift action_9
action_36 (40) = happyShift action_10
action_36 (41) = happyShift action_11
action_36 (42) = happyShift action_12
action_36 (43) = happyShift action_13
action_36 (44) = happyShift action_14
action_36 (45) = happyShift action_15
action_36 (46) = happyShift action_16
action_36 (47) = happyShift action_17
action_36 (48) = happyShift action_18
action_36 (8) = happyGoto action_77
action_36 (9) = happyGoto action_3
action_36 (10) = happyGoto action_4
action_36 (12) = happyGoto action_5
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_18

action_38 _ = happyReduce_39

action_39 _ = happyReduce_40

action_40 _ = happyReduce_41

action_41 _ = happyReduce_42

action_42 _ = happyReduce_43

action_43 _ = happyReduce_32

action_44 _ = happyReduce_36

action_45 _ = happyReduce_33

action_46 (21) = happyShift action_76
action_46 _ = happyFail (happyExpListPerState 46)

action_47 _ = happyReduce_14

action_48 (20) = happyShift action_6
action_48 (30) = happyShift action_7
action_48 (35) = happyShift action_8
action_48 (40) = happyShift action_10
action_48 (42) = happyShift action_12
action_48 (45) = happyShift action_44
action_48 (9) = happyGoto action_75
action_48 (10) = happyGoto action_4
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (20) = happyShift action_6
action_49 (30) = happyShift action_7
action_49 (35) = happyShift action_8
action_49 (40) = happyShift action_10
action_49 (42) = happyShift action_12
action_49 (45) = happyShift action_44
action_49 (9) = happyGoto action_74
action_49 (10) = happyGoto action_4
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (20) = happyShift action_6
action_50 (30) = happyShift action_7
action_50 (35) = happyShift action_8
action_50 (40) = happyShift action_10
action_50 (42) = happyShift action_12
action_50 (45) = happyShift action_44
action_50 (9) = happyGoto action_73
action_50 (10) = happyGoto action_4
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (20) = happyShift action_6
action_51 (30) = happyShift action_7
action_51 (35) = happyShift action_8
action_51 (40) = happyShift action_10
action_51 (42) = happyShift action_12
action_51 (45) = happyShift action_44
action_51 (9) = happyGoto action_72
action_51 (10) = happyGoto action_4
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (20) = happyShift action_6
action_52 (30) = happyShift action_7
action_52 (35) = happyShift action_8
action_52 (40) = happyShift action_10
action_52 (42) = happyShift action_12
action_52 (45) = happyShift action_44
action_52 (9) = happyGoto action_71
action_52 (10) = happyGoto action_4
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (20) = happyShift action_6
action_53 (30) = happyShift action_7
action_53 (35) = happyShift action_8
action_53 (40) = happyShift action_10
action_53 (42) = happyShift action_12
action_53 (45) = happyShift action_44
action_53 (9) = happyGoto action_70
action_53 (10) = happyGoto action_4
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (20) = happyShift action_6
action_54 (30) = happyShift action_7
action_54 (35) = happyShift action_8
action_54 (40) = happyShift action_10
action_54 (42) = happyShift action_12
action_54 (45) = happyShift action_44
action_54 (9) = happyGoto action_69
action_54 (10) = happyGoto action_4
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (20) = happyShift action_6
action_55 (30) = happyShift action_7
action_55 (35) = happyShift action_8
action_55 (40) = happyShift action_10
action_55 (42) = happyShift action_12
action_55 (45) = happyShift action_44
action_55 (9) = happyGoto action_68
action_55 (10) = happyGoto action_4
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (20) = happyShift action_6
action_56 (30) = happyShift action_7
action_56 (35) = happyShift action_8
action_56 (40) = happyShift action_10
action_56 (42) = happyShift action_12
action_56 (45) = happyShift action_44
action_56 (9) = happyGoto action_67
action_56 (10) = happyGoto action_4
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (20) = happyShift action_6
action_57 (30) = happyShift action_7
action_57 (35) = happyShift action_8
action_57 (40) = happyShift action_10
action_57 (42) = happyShift action_12
action_57 (45) = happyShift action_44
action_57 (9) = happyGoto action_66
action_57 (10) = happyGoto action_4
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (20) = happyShift action_6
action_58 (30) = happyShift action_7
action_58 (35) = happyShift action_8
action_58 (40) = happyShift action_10
action_58 (42) = happyShift action_12
action_58 (45) = happyShift action_44
action_58 (9) = happyGoto action_65
action_58 (10) = happyGoto action_4
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (20) = happyShift action_6
action_59 (30) = happyShift action_7
action_59 (35) = happyShift action_8
action_59 (40) = happyShift action_10
action_59 (42) = happyShift action_12
action_59 (45) = happyShift action_44
action_59 (9) = happyGoto action_64
action_59 (10) = happyGoto action_4
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (20) = happyShift action_6
action_60 (30) = happyShift action_7
action_60 (35) = happyShift action_8
action_60 (40) = happyShift action_10
action_60 (42) = happyShift action_12
action_60 (45) = happyShift action_44
action_60 (9) = happyGoto action_63
action_60 (10) = happyGoto action_4
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (13) = happyShift action_23
action_61 (14) = happyShift action_24
action_61 (20) = happyShift action_6
action_61 (30) = happyShift action_7
action_61 (35) = happyShift action_8
action_61 (38) = happyShift action_25
action_61 (39) = happyShift action_9
action_61 (40) = happyShift action_10
action_61 (41) = happyShift action_11
action_61 (42) = happyShift action_12
action_61 (43) = happyShift action_13
action_61 (44) = happyShift action_14
action_61 (45) = happyShift action_15
action_61 (46) = happyShift action_16
action_61 (47) = happyShift action_17
action_61 (48) = happyShift action_18
action_61 (4) = happyGoto action_62
action_61 (5) = happyGoto action_20
action_61 (6) = happyGoto action_21
action_61 (8) = happyGoto action_22
action_61 (9) = happyGoto action_3
action_61 (10) = happyGoto action_4
action_61 (12) = happyGoto action_5
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_1

action_63 (33) = happyShift action_57
action_63 (34) = happyShift action_58
action_63 (36) = happyShift action_60
action_63 _ = happyReduce_26

action_64 (33) = happyShift action_57
action_64 (34) = happyShift action_58
action_64 (36) = happyShift action_60
action_64 _ = happyReduce_20

action_65 (33) = happyShift action_57
action_65 (34) = happyShift action_58
action_65 (36) = happyShift action_60
action_65 _ = happyReduce_25

action_66 (33) = happyShift action_57
action_66 (34) = happyShift action_58
action_66 (36) = happyShift action_60
action_66 _ = happyReduce_27

action_67 (33) = happyShift action_57
action_67 (34) = happyShift action_58
action_67 (36) = happyShift action_60
action_67 _ = happyReduce_30

action_68 (33) = happyShift action_57
action_68 (34) = happyShift action_58
action_68 (36) = happyShift action_60
action_68 _ = happyReduce_31

action_69 (17) = happyShift action_48
action_69 (24) = happyFail []
action_69 (25) = happyFail []
action_69 (26) = happyFail []
action_69 (27) = happyFail []
action_69 (28) = happyFail []
action_69 (29) = happyFail []
action_69 (31) = happyShift action_55
action_69 (32) = happyShift action_56
action_69 (33) = happyShift action_57
action_69 (34) = happyShift action_58
action_69 (35) = happyShift action_59
action_69 (36) = happyShift action_60
action_69 _ = happyReduce_29

action_70 (17) = happyShift action_48
action_70 (24) = happyFail []
action_70 (25) = happyFail []
action_70 (26) = happyFail []
action_70 (27) = happyFail []
action_70 (28) = happyFail []
action_70 (29) = happyFail []
action_70 (31) = happyShift action_55
action_70 (32) = happyShift action_56
action_70 (33) = happyShift action_57
action_70 (34) = happyShift action_58
action_70 (35) = happyShift action_59
action_70 (36) = happyShift action_60
action_70 _ = happyReduce_28

action_71 (17) = happyShift action_48
action_71 (24) = happyFail []
action_71 (25) = happyFail []
action_71 (26) = happyFail []
action_71 (27) = happyFail []
action_71 (28) = happyFail []
action_71 (29) = happyFail []
action_71 (31) = happyShift action_55
action_71 (32) = happyShift action_56
action_71 (33) = happyShift action_57
action_71 (34) = happyShift action_58
action_71 (35) = happyShift action_59
action_71 (36) = happyShift action_60
action_71 _ = happyReduce_24

action_72 (17) = happyShift action_48
action_72 (24) = happyFail []
action_72 (25) = happyFail []
action_72 (26) = happyFail []
action_72 (27) = happyFail []
action_72 (28) = happyFail []
action_72 (29) = happyFail []
action_72 (31) = happyShift action_55
action_72 (32) = happyShift action_56
action_72 (33) = happyShift action_57
action_72 (34) = happyShift action_58
action_72 (35) = happyShift action_59
action_72 (36) = happyShift action_60
action_72 _ = happyReduce_22

action_73 (17) = happyShift action_48
action_73 (24) = happyFail []
action_73 (25) = happyFail []
action_73 (26) = happyFail []
action_73 (27) = happyFail []
action_73 (28) = happyFail []
action_73 (29) = happyFail []
action_73 (31) = happyShift action_55
action_73 (32) = happyShift action_56
action_73 (33) = happyShift action_57
action_73 (34) = happyShift action_58
action_73 (35) = happyShift action_59
action_73 (36) = happyShift action_60
action_73 _ = happyReduce_23

action_74 (17) = happyShift action_48
action_74 (24) = happyFail []
action_74 (25) = happyFail []
action_74 (26) = happyFail []
action_74 (27) = happyFail []
action_74 (28) = happyFail []
action_74 (29) = happyFail []
action_74 (31) = happyShift action_55
action_74 (32) = happyShift action_56
action_74 (33) = happyShift action_57
action_74 (34) = happyShift action_58
action_74 (35) = happyShift action_59
action_74 (36) = happyShift action_60
action_74 _ = happyReduce_21

action_75 (33) = happyShift action_57
action_75 (34) = happyShift action_58
action_75 (36) = happyShift action_60
action_75 _ = happyReduce_19

action_76 _ = happyReduce_35

action_77 _ = happyReduce_13

action_78 (21) = happyShift action_85
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (21) = happyShift action_84
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (19) = happyShift action_83
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (20) = happyShift action_82
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (49) = happyShift action_38
action_82 (50) = happyShift action_39
action_82 (51) = happyShift action_40
action_82 (52) = happyShift action_41
action_82 (53) = happyShift action_42
action_82 (11) = happyGoto action_88
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_11

action_84 (18) = happyShift action_27
action_84 (7) = happyGoto action_87
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (18) = happyShift action_27
action_85 (7) = happyGoto action_86
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (15) = happyShift action_90
action_86 _ = happyReduce_8

action_87 _ = happyReduce_10

action_88 (21) = happyShift action_89
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (18) = happyShift action_27
action_89 (7) = happyGoto action_92
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (18) = happyShift action_27
action_90 (7) = happyGoto action_91
action_90 _ = happyFail (happyExpListPerState 90)

action_91 _ = happyReduce_7

action_92 _ = happyReduce_9

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn4
		 (Stmt happy_var_1 happy_var_3
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 _
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  4 happyReduction_3
happyReduction_3 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Stmt happy_var_1 happy_var_2
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  4 happyReduction_4
happyReduction_4 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (Stmt happy_var_1 happy_var_2
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  4 happyReduction_5
happyReduction_5 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  4 happyReduction_6
happyReduction_6 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happyReduce 7 5 happyReduction_7
happyReduction_7 ((HappyAbsSyn7  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (IfStmtElse happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 5 5 happyReduction_8
happyReduction_8 ((HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (IfStmt happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 7 5 happyReduction_9
happyReduction_9 ((HappyAbsSyn7  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TryCatchStmt happy_var_2 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 5 6 happyReduction_10
happyReduction_10 ((HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (WhileStmt happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_3  7 happyReduction_11
happyReduction_11 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  8 happyReduction_12
happyReduction_12 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  8 happyReduction_13
happyReduction_13 (HappyAbsSyn8  happy_var_3)
	_
	(HappyTerminal (MkToken _ (TokenVar happy_var_1)))
	 =  HappyAbsSyn8
		 (AssignmentStmt happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  8 happyReduction_14
happyReduction_14 (HappyTerminal (MkToken _ (TokenVar happy_var_2)))
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn8
		 (Declaration happy_var_1 happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  8 happyReduction_15
happyReduction_15 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (PrintOp happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  8 happyReduction_16
happyReduction_16 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (ConsumeStream happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  8 happyReduction_17
happyReduction_17 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (Streams happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  8 happyReduction_18
happyReduction_18 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (ThrowStmt happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  9 happyReduction_19
happyReduction_19 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (AddOp happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  9 happyReduction_20
happyReduction_20 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (SubtractOp happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  9 happyReduction_21
happyReduction_21 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (LessThanOp happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  9 happyReduction_22
happyReduction_22 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (LessThanEqOp happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  9 happyReduction_23
happyReduction_23 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (GreaterThanOp happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  9 happyReduction_24
happyReduction_24 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (GreaterThanEqOp happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  9 happyReduction_25
happyReduction_25 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (MultiplyOp happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  9 happyReduction_26
happyReduction_26 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (ModuloOp happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  9 happyReduction_27
happyReduction_27 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (DivideOp happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  9 happyReduction_28
happyReduction_28 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (EqualOp happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  9 happyReduction_29
happyReduction_29 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (NotEqualOp happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  9 happyReduction_30
happyReduction_30 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (OrOp happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  9 happyReduction_31
happyReduction_31 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (AndOp happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_2  9 happyReduction_32
happyReduction_32 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (NegateOp happy_var_2
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_2  9 happyReduction_33
happyReduction_33 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (NotOp happy_var_2
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  9 happyReduction_34
happyReduction_34 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  10 happyReduction_35
happyReduction_35 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (happy_var_2
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  10 happyReduction_36
happyReduction_36 (HappyTerminal (MkToken _ (TokenVar happy_var_1)))
	 =  HappyAbsSyn10
		 (Variable happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  10 happyReduction_37
happyReduction_37 (HappyTerminal (MkToken _ (TokenBool happy_var_1)))
	 =  HappyAbsSyn10
		 (BoolVal happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  10 happyReduction_38
happyReduction_38 (HappyTerminal (MkToken _ (TokenNum happy_var_1)))
	 =  HappyAbsSyn10
		 (NumVal happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  11 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn11
		 (NullPointer
	)

happyReduce_40 = happySpecReduce_1  11 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn11
		 (StreamsNotIntialised
	)

happyReduce_41 = happySpecReduce_1  11 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn11
		 (NotExistingStreamConsumption
	)

happyReduce_42 = happySpecReduce_1  11 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn11
		 (DivideByZero
	)

happyReduce_43 = happySpecReduce_1  11 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn11
		 (Trap
	)

happyReduce_44 = happySpecReduce_1  12 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn12
		 (BoolT
	)

happyReduce_45 = happySpecReduce_1  12 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn12
		 (IntT
	)

happyReduce_46 = happySpecReduce_1  12 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn12
		 (VoidT
	)

happyNewToken action sts stk [] =
	action 54 54 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	MkToken _ TokenIf -> cont 13;
	MkToken _ TokenWhile -> cont 14;
	MkToken _ TokenElse -> cont 15;
	MkToken _ TokenEq -> cont 16;
	MkToken _ TokenAdd -> cont 17;
	MkToken _ TokenLCurly -> cont 18;
	MkToken _ TokenRCurly -> cont 19;
	MkToken _ TokenLParen -> cont 20;
	MkToken _ TokenRParen -> cont 21;
	MkToken _ TokenColon -> cont 22;
	MkToken _ TokenSemiColon -> cont 23;
	MkToken _ TokenLessThan -> cont 24;
	MkToken _ TokenGreaterThan -> cont 25;
	MkToken _ TokenLessThanEq -> cont 26;
	MkToken _ TokenGreaterThanEq -> cont 27;
	MkToken _ TokenLogicalEq -> cont 28;
	MkToken _ TokenNotEq -> cont 29;
	MkToken _ TokenLogicalNot -> cont 30;
	MkToken _ TokenLogicalAnd -> cont 31;
	MkToken _ TokenLogicalOr -> cont 32;
	MkToken _ TokenDivide -> cont 33;
	MkToken _ TokenMultiply -> cont 34;
	MkToken _ TokenSubtract -> cont 35;
	MkToken _ TokenModulo -> cont 36;
	MkToken _ TokenCatch -> cont 37;
	MkToken _ TokenTry -> cont 38;
	MkToken _ TokenThrow -> cont 39;
	MkToken _ (TokenNum happy_dollar_dollar) -> cont 40;
	MkToken _ TokenTInt -> cont 41;
	MkToken _ (TokenBool happy_dollar_dollar) -> cont 42;
	MkToken _ TokenTBool -> cont 43;
	MkToken _ TokenVoid -> cont 44;
	MkToken _ (TokenVar happy_dollar_dollar) -> cont 45;
	MkToken _ TokenPrint -> cont 46;
	MkToken _ TokenConsume -> cont 47;
	MkToken _ TokenInitStreams -> cont 48;
	MkToken _ TokenNPE -> cont 49;
	MkToken _ TokenSNIE -> cont 50;
	MkToken _ TokenNESCE -> cont 51;
	MkToken _ TokenDBZE -> cont 52;
	MkToken _ TokenTE -> cont 53;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 54 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parse tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError input = error ("error parsing in line " ++ (show line) ++ " column " ++ (show column))
    where
        line = fst position
        column = snd position
        position = tokenPosn $ head input


data Stmt = Stmt Stmt Stmt
               | IfStmtElse Stmt Stmt Stmt
               | IfStmt Stmt Stmt
               | WhileStmt Stmt Stmt
               | AssignmentStmt String Stmt
               | Declaration Type String
               | PrintOp Stmt
               | BoolVal Bool
               | Variable String
               | NumVal Int
               | Streams Stmt
               | ConsumeStream Stmt
               | TryCatchStmt Stmt ExceptionType Stmt
               | ThrowStmt ExceptionType
               | AddOp Stmt Stmt
               | LessThanOp Stmt Stmt
               | LessThanEqOp Stmt Stmt
               | GreaterThanOp Stmt Stmt
               | GreaterThanEqOp Stmt Stmt
               | SubtractOp Stmt Stmt
               | MultiplyOp Stmt Stmt
               | ModuloOp Stmt Stmt
               | DivideOp Stmt Stmt
               | EqualOp Stmt Stmt
               | NotEqualOp Stmt Stmt
               | OrOp Stmt Stmt
               | AndOp Stmt Stmt
               | NegateOp Stmt
               | NotOp Stmt
               deriving (Show)

data ExceptionType = NullPointer
               | StreamsNotIntialised
               | NotExistingStreamConsumption
               | DivideByZero
               | Trap
               deriving (Show)


data Type     = IntT
              | BoolT
              | VoidT
              | StmtT
              deriving (Show, Eq)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
