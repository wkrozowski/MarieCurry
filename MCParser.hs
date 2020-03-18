{-# OPTIONS_GHC -w #-}
module MCParser where
import MCLexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13
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
	| HappyAbsSyn13 t13

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,379) ([24576,80,65313,1775,0,320,63620,7103,0,8192,0,0,0,128,8127,1024,0,20480,0,148,2,0,0,0,0,0,0,2048,16,0,28,6656,128,0,80,65057,1775,0,320,20612,58,0,1280,16912,233,0,0,0,0,126,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,1280,57872,28415,0,5120,2112,933,0,20480,8448,3732,0,16384,33793,14928,0,0,4101,65506,110,0,16404,65416,443,0,64,0,512,0,0,0,0,0,1280,57872,28415,0,0,0,0,0,20576,8448,61439,6,16768,33793,49148,27,0,32,0,0,0,16,0,0,0,64,0,0,0,16,0,0,0,0,2048,0,0,5144,51264,48127,1,20480,8448,61438,6,16384,33793,49144,27,1536,4101,65522,110,0,0,0,0,0,0,0,0,0,0,0,0,0,1280,32768,8198,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,80,65057,1775,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,33793,49144,27,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,128,32768,256,0,128,0,1024,0,1280,32768,8198,0,0,0,0,0,20480,0,104,2,0,0,0,0,0,5,1664,32,0,0,0,0,0,0,0,0,0,320,20612,58,0,1280,16912,233,0,5120,2112,933,0,20480,8448,3732,0,16384,33793,14928,0,0,4101,59714,0,0,16404,42248,3,0,80,37921,14,0,320,20612,58,0,1280,16912,233,0,5120,2112,933,0,20480,8448,3732,0,16384,33793,14928,0,0,4101,59714,0,6144,16404,65480,443,0,0,0,0,0,0,352,0,0,0,1408,0,0,0,5632,0,0,0,22528,0,0,0,24576,1,0,0,32768,5,0,0,0,22,0,0,2,126,16,0,8,504,64,0,32,2016,256,0,128,8064,1024,0,512,32256,4096,0,2048,63488,16385,0,0,32768,5,0,0,0,0,64,0,128,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,8192,64,0,128,0,0,0,512,0,0,0,128,0,0,0,4096,0,0,0,0,0,0,504,0,0,0,0,16384,0,0,0,0,1,0,0,0,128,0,0,0,0,0,0,0,0,0,4096,0,32,0,0,0,0,0,0,0,0,2,0,0,16384,0,0,0,0,1,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Stmt","Selection_Stmt","Iteration_Stmt","Compound_Stmt","Expression","Operation","Exp1","Exp2","Exception","Type","if","while","else","'='","'+'","'{'","'}'","'['","']'","'('","')'","':'","';'","'<'","'>'","'<='","'>='","'=='","'!='","'!'","'&&'","'||'","'/'","'*'","'-'","'%'","catch","try","throw","number","intT","bool","boolT","void","var","print","head","tail","isEmpty","cons","consume","streams","lambda","'->'","unit","return","NullPointerException","StreamsNotInitialisedException","NotExistingStreamConsumptionException","DivideByZeroException","TrapException","ListEmptyException","%eof"]
        bit_start = st * 66
        bit_end = (st + 1) * 66
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..65]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (14) = happyShift action_31
action_0 (15) = happyShift action_32
action_0 (21) = happyShift action_7
action_0 (23) = happyShift action_8
action_0 (33) = happyShift action_9
action_0 (38) = happyShift action_10
action_0 (41) = happyShift action_33
action_0 (42) = happyShift action_11
action_0 (43) = happyShift action_12
action_0 (44) = happyShift action_13
action_0 (45) = happyShift action_14
action_0 (46) = happyShift action_15
action_0 (47) = happyShift action_16
action_0 (48) = happyShift action_17
action_0 (49) = happyShift action_18
action_0 (50) = happyShift action_19
action_0 (51) = happyShift action_20
action_0 (52) = happyShift action_21
action_0 (54) = happyShift action_22
action_0 (55) = happyShift action_23
action_0 (56) = happyShift action_24
action_0 (58) = happyShift action_25
action_0 (59) = happyShift action_26
action_0 (4) = happyGoto action_27
action_0 (5) = happyGoto action_28
action_0 (6) = happyGoto action_29
action_0 (8) = happyGoto action_30
action_0 (9) = happyGoto action_3
action_0 (10) = happyGoto action_4
action_0 (11) = happyGoto action_5
action_0 (13) = happyGoto action_6
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (21) = happyShift action_7
action_1 (23) = happyShift action_8
action_1 (33) = happyShift action_9
action_1 (38) = happyShift action_10
action_1 (42) = happyShift action_11
action_1 (43) = happyShift action_12
action_1 (44) = happyShift action_13
action_1 (45) = happyShift action_14
action_1 (46) = happyShift action_15
action_1 (47) = happyShift action_16
action_1 (48) = happyShift action_17
action_1 (49) = happyShift action_18
action_1 (50) = happyShift action_19
action_1 (51) = happyShift action_20
action_1 (52) = happyShift action_21
action_1 (54) = happyShift action_22
action_1 (55) = happyShift action_23
action_1 (56) = happyShift action_24
action_1 (58) = happyShift action_25
action_1 (59) = happyShift action_26
action_1 (8) = happyGoto action_2
action_1 (9) = happyGoto action_3
action_1 (10) = happyGoto action_4
action_1 (11) = happyGoto action_5
action_1 (13) = happyGoto action_6
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (26) = happyShift action_87
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (18) = happyShift action_73
action_3 (27) = happyShift action_74
action_3 (28) = happyShift action_75
action_3 (29) = happyShift action_76
action_3 (30) = happyShift action_77
action_3 (31) = happyShift action_78
action_3 (32) = happyShift action_79
action_3 (34) = happyShift action_80
action_3 (35) = happyShift action_81
action_3 (36) = happyShift action_82
action_3 (37) = happyShift action_83
action_3 (38) = happyShift action_84
action_3 (39) = happyShift action_85
action_3 (53) = happyShift action_86
action_3 _ = happyReduce_12

action_4 (21) = happyShift action_47
action_4 (23) = happyShift action_48
action_4 (43) = happyShift action_12
action_4 (45) = happyShift action_14
action_4 (48) = happyShift action_49
action_4 (58) = happyShift action_72
action_4 (11) = happyGoto action_71
action_4 _ = happyReduce_42

action_5 _ = happyReduce_45

action_6 (48) = happyShift action_69
action_6 (57) = happyShift action_70
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (21) = happyShift action_66
action_7 (22) = happyShift action_67
action_7 (23) = happyShift action_68
action_7 (44) = happyShift action_13
action_7 (46) = happyShift action_15
action_7 (47) = happyShift action_16
action_7 (58) = happyShift action_25
action_7 (13) = happyGoto action_65
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (21) = happyShift action_7
action_8 (23) = happyShift action_8
action_8 (33) = happyShift action_9
action_8 (38) = happyShift action_10
action_8 (42) = happyShift action_11
action_8 (43) = happyShift action_12
action_8 (44) = happyShift action_13
action_8 (45) = happyShift action_14
action_8 (46) = happyShift action_15
action_8 (47) = happyShift action_16
action_8 (48) = happyShift action_17
action_8 (49) = happyShift action_18
action_8 (50) = happyShift action_19
action_8 (51) = happyShift action_20
action_8 (52) = happyShift action_21
action_8 (54) = happyShift action_22
action_8 (55) = happyShift action_23
action_8 (56) = happyShift action_24
action_8 (58) = happyShift action_25
action_8 (59) = happyShift action_26
action_8 (8) = happyGoto action_63
action_8 (9) = happyGoto action_3
action_8 (10) = happyGoto action_4
action_8 (11) = happyGoto action_5
action_8 (13) = happyGoto action_64
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (21) = happyShift action_47
action_9 (23) = happyShift action_48
action_9 (33) = happyShift action_9
action_9 (38) = happyShift action_10
action_9 (43) = happyShift action_12
action_9 (45) = happyShift action_14
action_9 (48) = happyShift action_49
action_9 (50) = happyShift action_19
action_9 (51) = happyShift action_20
action_9 (52) = happyShift action_21
action_9 (9) = happyGoto action_62
action_9 (10) = happyGoto action_4
action_9 (11) = happyGoto action_5
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (21) = happyShift action_47
action_10 (23) = happyShift action_48
action_10 (33) = happyShift action_9
action_10 (38) = happyShift action_10
action_10 (43) = happyShift action_12
action_10 (45) = happyShift action_14
action_10 (48) = happyShift action_49
action_10 (50) = happyShift action_19
action_10 (51) = happyShift action_20
action_10 (52) = happyShift action_21
action_10 (9) = happyGoto action_61
action_10 (10) = happyGoto action_4
action_10 (11) = happyGoto action_5
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (60) = happyShift action_55
action_11 (61) = happyShift action_56
action_11 (62) = happyShift action_57
action_11 (63) = happyShift action_58
action_11 (64) = happyShift action_59
action_11 (65) = happyShift action_60
action_11 (12) = happyGoto action_54
action_11 _ = happyFail (happyExpListPerState 11)

action_12 _ = happyReduce_49

action_13 _ = happyReduce_58

action_14 _ = happyReduce_48

action_15 _ = happyReduce_57

action_16 _ = happyReduce_59

action_17 (17) = happyShift action_53
action_17 _ = happyReduce_47

action_18 (21) = happyShift action_7
action_18 (23) = happyShift action_8
action_18 (33) = happyShift action_9
action_18 (38) = happyShift action_10
action_18 (42) = happyShift action_11
action_18 (43) = happyShift action_12
action_18 (44) = happyShift action_13
action_18 (45) = happyShift action_14
action_18 (46) = happyShift action_15
action_18 (47) = happyShift action_16
action_18 (48) = happyShift action_17
action_18 (49) = happyShift action_18
action_18 (50) = happyShift action_19
action_18 (51) = happyShift action_20
action_18 (52) = happyShift action_21
action_18 (54) = happyShift action_22
action_18 (55) = happyShift action_23
action_18 (56) = happyShift action_24
action_18 (58) = happyShift action_25
action_18 (59) = happyShift action_26
action_18 (8) = happyGoto action_52
action_18 (9) = happyGoto action_3
action_18 (10) = happyGoto action_4
action_18 (11) = happyGoto action_5
action_18 (13) = happyGoto action_6
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (21) = happyShift action_47
action_19 (23) = happyShift action_48
action_19 (33) = happyShift action_9
action_19 (38) = happyShift action_10
action_19 (43) = happyShift action_12
action_19 (45) = happyShift action_14
action_19 (48) = happyShift action_49
action_19 (50) = happyShift action_19
action_19 (51) = happyShift action_20
action_19 (52) = happyShift action_21
action_19 (9) = happyGoto action_51
action_19 (10) = happyGoto action_4
action_19 (11) = happyGoto action_5
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (21) = happyShift action_47
action_20 (23) = happyShift action_48
action_20 (33) = happyShift action_9
action_20 (38) = happyShift action_10
action_20 (43) = happyShift action_12
action_20 (45) = happyShift action_14
action_20 (48) = happyShift action_49
action_20 (50) = happyShift action_19
action_20 (51) = happyShift action_20
action_20 (52) = happyShift action_21
action_20 (9) = happyGoto action_50
action_20 (10) = happyGoto action_4
action_20 (11) = happyGoto action_5
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (21) = happyShift action_47
action_21 (23) = happyShift action_48
action_21 (33) = happyShift action_9
action_21 (38) = happyShift action_10
action_21 (43) = happyShift action_12
action_21 (45) = happyShift action_14
action_21 (48) = happyShift action_49
action_21 (50) = happyShift action_19
action_21 (51) = happyShift action_20
action_21 (52) = happyShift action_21
action_21 (9) = happyGoto action_46
action_21 (10) = happyGoto action_4
action_21 (11) = happyGoto action_5
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (21) = happyShift action_7
action_22 (23) = happyShift action_8
action_22 (33) = happyShift action_9
action_22 (38) = happyShift action_10
action_22 (42) = happyShift action_11
action_22 (43) = happyShift action_12
action_22 (44) = happyShift action_13
action_22 (45) = happyShift action_14
action_22 (46) = happyShift action_15
action_22 (47) = happyShift action_16
action_22 (48) = happyShift action_17
action_22 (49) = happyShift action_18
action_22 (50) = happyShift action_19
action_22 (51) = happyShift action_20
action_22 (52) = happyShift action_21
action_22 (54) = happyShift action_22
action_22 (55) = happyShift action_23
action_22 (56) = happyShift action_24
action_22 (58) = happyShift action_25
action_22 (59) = happyShift action_26
action_22 (8) = happyGoto action_45
action_22 (9) = happyGoto action_3
action_22 (10) = happyGoto action_4
action_22 (11) = happyGoto action_5
action_22 (13) = happyGoto action_6
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (21) = happyShift action_7
action_23 (23) = happyShift action_8
action_23 (33) = happyShift action_9
action_23 (38) = happyShift action_10
action_23 (42) = happyShift action_11
action_23 (43) = happyShift action_12
action_23 (44) = happyShift action_13
action_23 (45) = happyShift action_14
action_23 (46) = happyShift action_15
action_23 (47) = happyShift action_16
action_23 (48) = happyShift action_17
action_23 (49) = happyShift action_18
action_23 (50) = happyShift action_19
action_23 (51) = happyShift action_20
action_23 (52) = happyShift action_21
action_23 (54) = happyShift action_22
action_23 (55) = happyShift action_23
action_23 (56) = happyShift action_24
action_23 (58) = happyShift action_25
action_23 (59) = happyShift action_26
action_23 (8) = happyGoto action_44
action_23 (9) = happyGoto action_3
action_23 (10) = happyGoto action_4
action_23 (11) = happyGoto action_5
action_23 (13) = happyGoto action_6
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (23) = happyShift action_42
action_24 (58) = happyShift action_43
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyReduce_60

action_26 (21) = happyShift action_7
action_26 (23) = happyShift action_8
action_26 (33) = happyShift action_9
action_26 (38) = happyShift action_10
action_26 (42) = happyShift action_11
action_26 (43) = happyShift action_12
action_26 (44) = happyShift action_13
action_26 (45) = happyShift action_14
action_26 (46) = happyShift action_15
action_26 (47) = happyShift action_16
action_26 (48) = happyShift action_17
action_26 (49) = happyShift action_18
action_26 (50) = happyShift action_19
action_26 (51) = happyShift action_20
action_26 (52) = happyShift action_21
action_26 (54) = happyShift action_22
action_26 (55) = happyShift action_23
action_26 (56) = happyShift action_24
action_26 (58) = happyShift action_25
action_26 (59) = happyShift action_26
action_26 (8) = happyGoto action_41
action_26 (9) = happyGoto action_3
action_26 (10) = happyGoto action_4
action_26 (11) = happyGoto action_5
action_26 (13) = happyGoto action_6
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (66) = happyAccept
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (14) = happyShift action_31
action_28 (15) = happyShift action_32
action_28 (21) = happyShift action_7
action_28 (23) = happyShift action_8
action_28 (33) = happyShift action_9
action_28 (38) = happyShift action_10
action_28 (41) = happyShift action_33
action_28 (42) = happyShift action_11
action_28 (43) = happyShift action_12
action_28 (44) = happyShift action_13
action_28 (45) = happyShift action_14
action_28 (46) = happyShift action_15
action_28 (47) = happyShift action_16
action_28 (48) = happyShift action_17
action_28 (49) = happyShift action_18
action_28 (50) = happyShift action_19
action_28 (51) = happyShift action_20
action_28 (52) = happyShift action_21
action_28 (54) = happyShift action_22
action_28 (55) = happyShift action_23
action_28 (56) = happyShift action_24
action_28 (58) = happyShift action_25
action_28 (59) = happyShift action_26
action_28 (4) = happyGoto action_40
action_28 (5) = happyGoto action_28
action_28 (6) = happyGoto action_29
action_28 (8) = happyGoto action_30
action_28 (9) = happyGoto action_3
action_28 (10) = happyGoto action_4
action_28 (11) = happyGoto action_5
action_28 (13) = happyGoto action_6
action_28 _ = happyReduce_5

action_29 (14) = happyShift action_31
action_29 (15) = happyShift action_32
action_29 (21) = happyShift action_7
action_29 (23) = happyShift action_8
action_29 (33) = happyShift action_9
action_29 (38) = happyShift action_10
action_29 (41) = happyShift action_33
action_29 (42) = happyShift action_11
action_29 (43) = happyShift action_12
action_29 (44) = happyShift action_13
action_29 (45) = happyShift action_14
action_29 (46) = happyShift action_15
action_29 (47) = happyShift action_16
action_29 (48) = happyShift action_17
action_29 (49) = happyShift action_18
action_29 (50) = happyShift action_19
action_29 (51) = happyShift action_20
action_29 (52) = happyShift action_21
action_29 (54) = happyShift action_22
action_29 (55) = happyShift action_23
action_29 (56) = happyShift action_24
action_29 (58) = happyShift action_25
action_29 (59) = happyShift action_26
action_29 (4) = happyGoto action_39
action_29 (5) = happyGoto action_28
action_29 (6) = happyGoto action_29
action_29 (8) = happyGoto action_30
action_29 (9) = happyGoto action_3
action_29 (10) = happyGoto action_4
action_29 (11) = happyGoto action_5
action_29 (13) = happyGoto action_6
action_29 _ = happyReduce_6

action_30 (26) = happyShift action_38
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (23) = happyShift action_37
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (23) = happyShift action_36
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (19) = happyShift action_35
action_33 (7) = happyGoto action_34
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (40) = happyShift action_115
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (14) = happyShift action_31
action_35 (15) = happyShift action_32
action_35 (21) = happyShift action_7
action_35 (23) = happyShift action_8
action_35 (33) = happyShift action_9
action_35 (38) = happyShift action_10
action_35 (41) = happyShift action_33
action_35 (42) = happyShift action_11
action_35 (43) = happyShift action_12
action_35 (44) = happyShift action_13
action_35 (45) = happyShift action_14
action_35 (46) = happyShift action_15
action_35 (47) = happyShift action_16
action_35 (48) = happyShift action_17
action_35 (49) = happyShift action_18
action_35 (50) = happyShift action_19
action_35 (51) = happyShift action_20
action_35 (52) = happyShift action_21
action_35 (54) = happyShift action_22
action_35 (55) = happyShift action_23
action_35 (56) = happyShift action_24
action_35 (58) = happyShift action_25
action_35 (59) = happyShift action_26
action_35 (4) = happyGoto action_114
action_35 (5) = happyGoto action_28
action_35 (6) = happyGoto action_29
action_35 (8) = happyGoto action_30
action_35 (9) = happyGoto action_3
action_35 (10) = happyGoto action_4
action_35 (11) = happyGoto action_5
action_35 (13) = happyGoto action_6
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (21) = happyShift action_7
action_36 (23) = happyShift action_8
action_36 (33) = happyShift action_9
action_36 (38) = happyShift action_10
action_36 (42) = happyShift action_11
action_36 (43) = happyShift action_12
action_36 (44) = happyShift action_13
action_36 (45) = happyShift action_14
action_36 (46) = happyShift action_15
action_36 (47) = happyShift action_16
action_36 (48) = happyShift action_17
action_36 (49) = happyShift action_18
action_36 (50) = happyShift action_19
action_36 (51) = happyShift action_20
action_36 (52) = happyShift action_21
action_36 (54) = happyShift action_22
action_36 (55) = happyShift action_23
action_36 (56) = happyShift action_24
action_36 (58) = happyShift action_25
action_36 (59) = happyShift action_26
action_36 (8) = happyGoto action_113
action_36 (9) = happyGoto action_3
action_36 (10) = happyGoto action_4
action_36 (11) = happyGoto action_5
action_36 (13) = happyGoto action_6
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (21) = happyShift action_7
action_37 (23) = happyShift action_8
action_37 (33) = happyShift action_9
action_37 (38) = happyShift action_10
action_37 (42) = happyShift action_11
action_37 (43) = happyShift action_12
action_37 (44) = happyShift action_13
action_37 (45) = happyShift action_14
action_37 (46) = happyShift action_15
action_37 (47) = happyShift action_16
action_37 (48) = happyShift action_17
action_37 (49) = happyShift action_18
action_37 (50) = happyShift action_19
action_37 (51) = happyShift action_20
action_37 (52) = happyShift action_21
action_37 (54) = happyShift action_22
action_37 (55) = happyShift action_23
action_37 (56) = happyShift action_24
action_37 (58) = happyShift action_25
action_37 (59) = happyShift action_26
action_37 (8) = happyGoto action_112
action_37 (9) = happyGoto action_3
action_37 (10) = happyGoto action_4
action_37 (11) = happyGoto action_5
action_37 (13) = happyGoto action_6
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (14) = happyShift action_31
action_38 (15) = happyShift action_32
action_38 (21) = happyShift action_7
action_38 (23) = happyShift action_8
action_38 (33) = happyShift action_9
action_38 (38) = happyShift action_10
action_38 (41) = happyShift action_33
action_38 (42) = happyShift action_11
action_38 (43) = happyShift action_12
action_38 (44) = happyShift action_13
action_38 (45) = happyShift action_14
action_38 (46) = happyShift action_15
action_38 (47) = happyShift action_16
action_38 (48) = happyShift action_17
action_38 (49) = happyShift action_18
action_38 (50) = happyShift action_19
action_38 (51) = happyShift action_20
action_38 (52) = happyShift action_21
action_38 (54) = happyShift action_22
action_38 (55) = happyShift action_23
action_38 (56) = happyShift action_24
action_38 (58) = happyShift action_25
action_38 (59) = happyShift action_26
action_38 (4) = happyGoto action_88
action_38 (5) = happyGoto action_28
action_38 (6) = happyGoto action_29
action_38 (8) = happyGoto action_30
action_38 (9) = happyGoto action_3
action_38 (10) = happyGoto action_4
action_38 (11) = happyGoto action_5
action_38 (13) = happyGoto action_6
action_38 _ = happyReduce_2

action_39 _ = happyReduce_4

action_40 _ = happyReduce_3

action_41 _ = happyReduce_19

action_42 (21) = happyShift action_66
action_42 (23) = happyShift action_68
action_42 (44) = happyShift action_13
action_42 (46) = happyShift action_15
action_42 (47) = happyShift action_16
action_42 (58) = happyShift action_25
action_42 (13) = happyGoto action_111
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (57) = happyShift action_110
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_18

action_45 _ = happyReduce_17

action_46 _ = happyReduce_41

action_47 (22) = happyShift action_67
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (21) = happyShift action_7
action_48 (23) = happyShift action_8
action_48 (33) = happyShift action_9
action_48 (38) = happyShift action_10
action_48 (42) = happyShift action_11
action_48 (43) = happyShift action_12
action_48 (44) = happyShift action_13
action_48 (45) = happyShift action_14
action_48 (46) = happyShift action_15
action_48 (47) = happyShift action_16
action_48 (48) = happyShift action_17
action_48 (49) = happyShift action_18
action_48 (50) = happyShift action_19
action_48 (51) = happyShift action_20
action_48 (52) = happyShift action_21
action_48 (54) = happyShift action_22
action_48 (55) = happyShift action_23
action_48 (56) = happyShift action_24
action_48 (58) = happyShift action_25
action_48 (59) = happyShift action_26
action_48 (8) = happyGoto action_63
action_48 (9) = happyGoto action_3
action_48 (10) = happyGoto action_4
action_48 (11) = happyGoto action_5
action_48 (13) = happyGoto action_6
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_47

action_50 _ = happyReduce_39

action_51 _ = happyReduce_40

action_52 _ = happyReduce_16

action_53 (21) = happyShift action_7
action_53 (23) = happyShift action_8
action_53 (33) = happyShift action_9
action_53 (38) = happyShift action_10
action_53 (42) = happyShift action_11
action_53 (43) = happyShift action_12
action_53 (44) = happyShift action_13
action_53 (45) = happyShift action_14
action_53 (46) = happyShift action_15
action_53 (47) = happyShift action_16
action_53 (48) = happyShift action_17
action_53 (49) = happyShift action_18
action_53 (50) = happyShift action_19
action_53 (51) = happyShift action_20
action_53 (52) = happyShift action_21
action_53 (54) = happyShift action_22
action_53 (55) = happyShift action_23
action_53 (56) = happyShift action_24
action_53 (58) = happyShift action_109
action_53 (59) = happyShift action_26
action_53 (8) = happyGoto action_108
action_53 (9) = happyGoto action_3
action_53 (10) = happyGoto action_4
action_53 (11) = happyGoto action_5
action_53 (13) = happyGoto action_6
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_20

action_55 _ = happyReduce_51

action_56 _ = happyReduce_52

action_57 _ = happyReduce_53

action_58 _ = happyReduce_54

action_59 _ = happyReduce_55

action_60 _ = happyReduce_56

action_61 _ = happyReduce_37

action_62 _ = happyReduce_38

action_63 (24) = happyShift action_107
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (24) = happyShift action_106
action_64 (48) = happyShift action_69
action_64 (57) = happyShift action_70
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (22) = happyShift action_105
action_65 (57) = happyShift action_70
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (21) = happyShift action_66
action_66 (23) = happyShift action_68
action_66 (44) = happyShift action_13
action_66 (46) = happyShift action_15
action_66 (47) = happyShift action_16
action_66 (58) = happyShift action_25
action_66 (13) = happyGoto action_65
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_50

action_68 (21) = happyShift action_66
action_68 (23) = happyShift action_68
action_68 (44) = happyShift action_13
action_68 (46) = happyShift action_15
action_68 (47) = happyShift action_16
action_68 (58) = happyShift action_25
action_68 (13) = happyGoto action_104
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_15

action_70 (21) = happyShift action_66
action_70 (23) = happyShift action_68
action_70 (44) = happyShift action_13
action_70 (46) = happyShift action_15
action_70 (47) = happyShift action_16
action_70 (58) = happyShift action_25
action_70 (13) = happyGoto action_103
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_43

action_72 _ = happyReduce_44

action_73 (21) = happyShift action_47
action_73 (23) = happyShift action_48
action_73 (33) = happyShift action_9
action_73 (38) = happyShift action_10
action_73 (43) = happyShift action_12
action_73 (45) = happyShift action_14
action_73 (48) = happyShift action_49
action_73 (50) = happyShift action_19
action_73 (51) = happyShift action_20
action_73 (52) = happyShift action_21
action_73 (9) = happyGoto action_102
action_73 (10) = happyGoto action_4
action_73 (11) = happyGoto action_5
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (21) = happyShift action_47
action_74 (23) = happyShift action_48
action_74 (33) = happyShift action_9
action_74 (38) = happyShift action_10
action_74 (43) = happyShift action_12
action_74 (45) = happyShift action_14
action_74 (48) = happyShift action_49
action_74 (50) = happyShift action_19
action_74 (51) = happyShift action_20
action_74 (52) = happyShift action_21
action_74 (9) = happyGoto action_101
action_74 (10) = happyGoto action_4
action_74 (11) = happyGoto action_5
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (21) = happyShift action_47
action_75 (23) = happyShift action_48
action_75 (33) = happyShift action_9
action_75 (38) = happyShift action_10
action_75 (43) = happyShift action_12
action_75 (45) = happyShift action_14
action_75 (48) = happyShift action_49
action_75 (50) = happyShift action_19
action_75 (51) = happyShift action_20
action_75 (52) = happyShift action_21
action_75 (9) = happyGoto action_100
action_75 (10) = happyGoto action_4
action_75 (11) = happyGoto action_5
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (21) = happyShift action_47
action_76 (23) = happyShift action_48
action_76 (33) = happyShift action_9
action_76 (38) = happyShift action_10
action_76 (43) = happyShift action_12
action_76 (45) = happyShift action_14
action_76 (48) = happyShift action_49
action_76 (50) = happyShift action_19
action_76 (51) = happyShift action_20
action_76 (52) = happyShift action_21
action_76 (9) = happyGoto action_99
action_76 (10) = happyGoto action_4
action_76 (11) = happyGoto action_5
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (21) = happyShift action_47
action_77 (23) = happyShift action_48
action_77 (33) = happyShift action_9
action_77 (38) = happyShift action_10
action_77 (43) = happyShift action_12
action_77 (45) = happyShift action_14
action_77 (48) = happyShift action_49
action_77 (50) = happyShift action_19
action_77 (51) = happyShift action_20
action_77 (52) = happyShift action_21
action_77 (9) = happyGoto action_98
action_77 (10) = happyGoto action_4
action_77 (11) = happyGoto action_5
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (21) = happyShift action_47
action_78 (23) = happyShift action_48
action_78 (33) = happyShift action_9
action_78 (38) = happyShift action_10
action_78 (43) = happyShift action_12
action_78 (45) = happyShift action_14
action_78 (48) = happyShift action_49
action_78 (50) = happyShift action_19
action_78 (51) = happyShift action_20
action_78 (52) = happyShift action_21
action_78 (9) = happyGoto action_97
action_78 (10) = happyGoto action_4
action_78 (11) = happyGoto action_5
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (21) = happyShift action_47
action_79 (23) = happyShift action_48
action_79 (33) = happyShift action_9
action_79 (38) = happyShift action_10
action_79 (43) = happyShift action_12
action_79 (45) = happyShift action_14
action_79 (48) = happyShift action_49
action_79 (50) = happyShift action_19
action_79 (51) = happyShift action_20
action_79 (52) = happyShift action_21
action_79 (9) = happyGoto action_96
action_79 (10) = happyGoto action_4
action_79 (11) = happyGoto action_5
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (21) = happyShift action_47
action_80 (23) = happyShift action_48
action_80 (33) = happyShift action_9
action_80 (38) = happyShift action_10
action_80 (43) = happyShift action_12
action_80 (45) = happyShift action_14
action_80 (48) = happyShift action_49
action_80 (50) = happyShift action_19
action_80 (51) = happyShift action_20
action_80 (52) = happyShift action_21
action_80 (9) = happyGoto action_95
action_80 (10) = happyGoto action_4
action_80 (11) = happyGoto action_5
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (21) = happyShift action_47
action_81 (23) = happyShift action_48
action_81 (33) = happyShift action_9
action_81 (38) = happyShift action_10
action_81 (43) = happyShift action_12
action_81 (45) = happyShift action_14
action_81 (48) = happyShift action_49
action_81 (50) = happyShift action_19
action_81 (51) = happyShift action_20
action_81 (52) = happyShift action_21
action_81 (9) = happyGoto action_94
action_81 (10) = happyGoto action_4
action_81 (11) = happyGoto action_5
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (21) = happyShift action_47
action_82 (23) = happyShift action_48
action_82 (33) = happyShift action_9
action_82 (38) = happyShift action_10
action_82 (43) = happyShift action_12
action_82 (45) = happyShift action_14
action_82 (48) = happyShift action_49
action_82 (50) = happyShift action_19
action_82 (51) = happyShift action_20
action_82 (52) = happyShift action_21
action_82 (9) = happyGoto action_93
action_82 (10) = happyGoto action_4
action_82 (11) = happyGoto action_5
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (21) = happyShift action_47
action_83 (23) = happyShift action_48
action_83 (33) = happyShift action_9
action_83 (38) = happyShift action_10
action_83 (43) = happyShift action_12
action_83 (45) = happyShift action_14
action_83 (48) = happyShift action_49
action_83 (50) = happyShift action_19
action_83 (51) = happyShift action_20
action_83 (52) = happyShift action_21
action_83 (9) = happyGoto action_92
action_83 (10) = happyGoto action_4
action_83 (11) = happyGoto action_5
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (21) = happyShift action_47
action_84 (23) = happyShift action_48
action_84 (33) = happyShift action_9
action_84 (38) = happyShift action_10
action_84 (43) = happyShift action_12
action_84 (45) = happyShift action_14
action_84 (48) = happyShift action_49
action_84 (50) = happyShift action_19
action_84 (51) = happyShift action_20
action_84 (52) = happyShift action_21
action_84 (9) = happyGoto action_91
action_84 (10) = happyGoto action_4
action_84 (11) = happyGoto action_5
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (21) = happyShift action_47
action_85 (23) = happyShift action_48
action_85 (33) = happyShift action_9
action_85 (38) = happyShift action_10
action_85 (43) = happyShift action_12
action_85 (45) = happyShift action_14
action_85 (48) = happyShift action_49
action_85 (50) = happyShift action_19
action_85 (51) = happyShift action_20
action_85 (52) = happyShift action_21
action_85 (9) = happyGoto action_90
action_85 (10) = happyGoto action_4
action_85 (11) = happyGoto action_5
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (21) = happyShift action_47
action_86 (23) = happyShift action_48
action_86 (33) = happyShift action_9
action_86 (38) = happyShift action_10
action_86 (43) = happyShift action_12
action_86 (45) = happyShift action_14
action_86 (48) = happyShift action_49
action_86 (50) = happyShift action_19
action_86 (51) = happyShift action_20
action_86 (52) = happyShift action_21
action_86 (9) = happyGoto action_89
action_86 (10) = happyGoto action_4
action_86 (11) = happyGoto action_5
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (14) = happyShift action_31
action_87 (15) = happyShift action_32
action_87 (21) = happyShift action_7
action_87 (23) = happyShift action_8
action_87 (33) = happyShift action_9
action_87 (38) = happyShift action_10
action_87 (41) = happyShift action_33
action_87 (42) = happyShift action_11
action_87 (43) = happyShift action_12
action_87 (44) = happyShift action_13
action_87 (45) = happyShift action_14
action_87 (46) = happyShift action_15
action_87 (47) = happyShift action_16
action_87 (48) = happyShift action_17
action_87 (49) = happyShift action_18
action_87 (50) = happyShift action_19
action_87 (51) = happyShift action_20
action_87 (52) = happyShift action_21
action_87 (54) = happyShift action_22
action_87 (55) = happyShift action_23
action_87 (56) = happyShift action_24
action_87 (58) = happyShift action_25
action_87 (59) = happyShift action_26
action_87 (4) = happyGoto action_88
action_87 (5) = happyGoto action_28
action_87 (6) = happyGoto action_29
action_87 (8) = happyGoto action_30
action_87 (9) = happyGoto action_3
action_87 (10) = happyGoto action_4
action_87 (11) = happyGoto action_5
action_87 (13) = happyGoto action_6
action_87 _ = happyFail (happyExpListPerState 87)

action_88 _ = happyReduce_1

action_89 (36) = happyShift action_82
action_89 (37) = happyShift action_83
action_89 (39) = happyShift action_85
action_89 _ = happyReduce_36

action_90 (36) = happyShift action_82
action_90 (37) = happyShift action_83
action_90 (39) = happyShift action_85
action_90 _ = happyReduce_30

action_91 (36) = happyShift action_82
action_91 (37) = happyShift action_83
action_91 (39) = happyShift action_85
action_91 _ = happyReduce_24

action_92 (36) = happyShift action_82
action_92 (37) = happyShift action_83
action_92 (39) = happyShift action_85
action_92 _ = happyReduce_29

action_93 (36) = happyShift action_82
action_93 (37) = happyShift action_83
action_93 (39) = happyShift action_85
action_93 _ = happyReduce_31

action_94 (36) = happyShift action_82
action_94 (37) = happyShift action_83
action_94 (39) = happyShift action_85
action_94 _ = happyReduce_34

action_95 (36) = happyShift action_82
action_95 (37) = happyShift action_83
action_95 (39) = happyShift action_85
action_95 _ = happyReduce_35

action_96 (18) = happyShift action_73
action_96 (27) = happyFail []
action_96 (28) = happyFail []
action_96 (29) = happyFail []
action_96 (30) = happyFail []
action_96 (31) = happyFail []
action_96 (32) = happyFail []
action_96 (34) = happyShift action_80
action_96 (35) = happyShift action_81
action_96 (36) = happyShift action_82
action_96 (37) = happyShift action_83
action_96 (38) = happyShift action_84
action_96 (39) = happyShift action_85
action_96 (53) = happyShift action_86
action_96 _ = happyReduce_33

action_97 (18) = happyShift action_73
action_97 (27) = happyFail []
action_97 (28) = happyFail []
action_97 (29) = happyFail []
action_97 (30) = happyFail []
action_97 (31) = happyFail []
action_97 (32) = happyFail []
action_97 (34) = happyShift action_80
action_97 (35) = happyShift action_81
action_97 (36) = happyShift action_82
action_97 (37) = happyShift action_83
action_97 (38) = happyShift action_84
action_97 (39) = happyShift action_85
action_97 (53) = happyShift action_86
action_97 _ = happyReduce_32

action_98 (18) = happyShift action_73
action_98 (27) = happyFail []
action_98 (28) = happyFail []
action_98 (29) = happyFail []
action_98 (30) = happyFail []
action_98 (31) = happyFail []
action_98 (32) = happyFail []
action_98 (34) = happyShift action_80
action_98 (35) = happyShift action_81
action_98 (36) = happyShift action_82
action_98 (37) = happyShift action_83
action_98 (38) = happyShift action_84
action_98 (39) = happyShift action_85
action_98 (53) = happyShift action_86
action_98 _ = happyReduce_28

action_99 (18) = happyShift action_73
action_99 (27) = happyFail []
action_99 (28) = happyFail []
action_99 (29) = happyFail []
action_99 (30) = happyFail []
action_99 (31) = happyFail []
action_99 (32) = happyFail []
action_99 (34) = happyShift action_80
action_99 (35) = happyShift action_81
action_99 (36) = happyShift action_82
action_99 (37) = happyShift action_83
action_99 (38) = happyShift action_84
action_99 (39) = happyShift action_85
action_99 (53) = happyShift action_86
action_99 _ = happyReduce_26

action_100 (18) = happyShift action_73
action_100 (27) = happyFail []
action_100 (28) = happyFail []
action_100 (29) = happyFail []
action_100 (30) = happyFail []
action_100 (31) = happyFail []
action_100 (32) = happyFail []
action_100 (34) = happyShift action_80
action_100 (35) = happyShift action_81
action_100 (36) = happyShift action_82
action_100 (37) = happyShift action_83
action_100 (38) = happyShift action_84
action_100 (39) = happyShift action_85
action_100 (53) = happyShift action_86
action_100 _ = happyReduce_27

action_101 (18) = happyShift action_73
action_101 (27) = happyFail []
action_101 (28) = happyFail []
action_101 (29) = happyFail []
action_101 (30) = happyFail []
action_101 (31) = happyFail []
action_101 (32) = happyFail []
action_101 (34) = happyShift action_80
action_101 (35) = happyShift action_81
action_101 (36) = happyShift action_82
action_101 (37) = happyShift action_83
action_101 (38) = happyShift action_84
action_101 (39) = happyShift action_85
action_101 (53) = happyShift action_86
action_101 _ = happyReduce_25

action_102 (36) = happyShift action_82
action_102 (37) = happyShift action_83
action_102 (39) = happyShift action_85
action_102 _ = happyReduce_23

action_103 (57) = happyShift action_70
action_103 _ = happyReduce_62

action_104 (24) = happyShift action_106
action_104 (57) = happyShift action_70
action_104 _ = happyFail (happyExpListPerState 104)

action_105 _ = happyReduce_61

action_106 _ = happyReduce_63

action_107 _ = happyReduce_46

action_108 _ = happyReduce_13

action_109 (48) = happyReduce_60
action_109 (57) = happyReduce_60
action_109 _ = happyReduce_14

action_110 (19) = happyShift action_35
action_110 (7) = happyGoto action_121
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (48) = happyShift action_120
action_111 (57) = happyShift action_70
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (24) = happyShift action_119
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (24) = happyShift action_118
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (20) = happyShift action_117
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (23) = happyShift action_116
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (60) = happyShift action_55
action_116 (61) = happyShift action_56
action_116 (62) = happyShift action_57
action_116 (63) = happyShift action_58
action_116 (64) = happyShift action_59
action_116 (65) = happyShift action_60
action_116 (12) = happyGoto action_125
action_116 _ = happyFail (happyExpListPerState 116)

action_117 _ = happyReduce_11

action_118 (19) = happyShift action_35
action_118 (7) = happyGoto action_124
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (19) = happyShift action_35
action_119 (7) = happyGoto action_123
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (24) = happyShift action_122
action_120 _ = happyFail (happyExpListPerState 120)

action_121 _ = happyReduce_22

action_122 (57) = happyShift action_128
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (16) = happyShift action_127
action_123 _ = happyReduce_8

action_124 _ = happyReduce_10

action_125 (24) = happyShift action_126
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (19) = happyShift action_35
action_126 (7) = happyGoto action_131
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (19) = happyShift action_35
action_127 (7) = happyGoto action_130
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (19) = happyShift action_35
action_128 (7) = happyGoto action_129
action_128 _ = happyFail (happyExpListPerState 128)

action_129 _ = happyReduce_21

action_130 _ = happyReduce_7

action_131 _ = happyReduce_9

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
	(HappyAbsSyn12  happy_var_5) `HappyStk`
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

happyReduce_14 = happySpecReduce_3  8 happyReduction_14
happyReduction_14 _
	_
	(HappyTerminal (MkToken _ (TokenVar happy_var_1)))
	 =  HappyAbsSyn8
		 (AssignmentStmt happy_var_1 UnitVal
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  8 happyReduction_15
happyReduction_15 (HappyTerminal (MkToken _ (TokenVar happy_var_2)))
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn8
		 (Declaration happy_var_1 happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  8 happyReduction_16
happyReduction_16 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (PrintOp happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  8 happyReduction_17
happyReduction_17 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (ConsumeStream happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  8 happyReduction_18
happyReduction_18 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (Streams happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  8 happyReduction_19
happyReduction_19 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (ReturnOp happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  8 happyReduction_20
happyReduction_20 (HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (ThrowStmt happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happyReduce 7 8 happyReduction_21
happyReduction_21 ((HappyAbsSyn7  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (MkToken _ (TokenVar happy_var_4))) `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (LamExpr happy_var_3 happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 4 8 happyReduction_22
happyReduction_22 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (LamExpr UnitT "()" happy_var_4
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_3  9 happyReduction_23
happyReduction_23 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (AddOp happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  9 happyReduction_24
happyReduction_24 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (SubtractOp happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  9 happyReduction_25
happyReduction_25 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (LessThanOp happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  9 happyReduction_26
happyReduction_26 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (LessThanEqOp happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  9 happyReduction_27
happyReduction_27 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (GreaterThanOp happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  9 happyReduction_28
happyReduction_28 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (GreaterThanEqOp happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  9 happyReduction_29
happyReduction_29 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (MultiplyOp happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  9 happyReduction_30
happyReduction_30 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (ModuloOp happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  9 happyReduction_31
happyReduction_31 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (DivideOp happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  9 happyReduction_32
happyReduction_32 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (EqualOp happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  9 happyReduction_33
happyReduction_33 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (NotEqualOp happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  9 happyReduction_34
happyReduction_34 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (OrOp happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  9 happyReduction_35
happyReduction_35 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (AndOp happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  9 happyReduction_36
happyReduction_36 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (ConsOp happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_2  9 happyReduction_37
happyReduction_37 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (NegateOp happy_var_2
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_2  9 happyReduction_38
happyReduction_38 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (NotOp happy_var_2
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_2  9 happyReduction_39
happyReduction_39 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (TailOp happy_var_2
	)
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_2  9 happyReduction_40
happyReduction_40 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (HeadOp happy_var_2
	)
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_2  9 happyReduction_41
happyReduction_41 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (IsEmptyOp happy_var_2
	)
happyReduction_41 _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  9 happyReduction_42
happyReduction_42 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_2  10 happyReduction_43
happyReduction_43 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Application happy_var_1 happy_var_2
	)
happyReduction_43 _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_2  10 happyReduction_44
happyReduction_44 _
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Application happy_var_1 UnitVal
	)
happyReduction_44 _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  10 happyReduction_45
happyReduction_45 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  11 happyReduction_46
happyReduction_46 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  11 happyReduction_47
happyReduction_47 (HappyTerminal (MkToken _ (TokenVar happy_var_1)))
	 =  HappyAbsSyn11
		 (Variable happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  11 happyReduction_48
happyReduction_48 (HappyTerminal (MkToken _ (TokenBool happy_var_1)))
	 =  HappyAbsSyn11
		 (BoolVal happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  11 happyReduction_49
happyReduction_49 (HappyTerminal (MkToken _ (TokenNum happy_var_1)))
	 =  HappyAbsSyn11
		 (NumVal happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_2  11 happyReduction_50
happyReduction_50 _
	_
	 =  HappyAbsSyn11
		 (EmptyListVal
	)

happyReduce_51 = happySpecReduce_1  12 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn12
		 (NullPointer
	)

happyReduce_52 = happySpecReduce_1  12 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn12
		 (StreamsNotIntialised
	)

happyReduce_53 = happySpecReduce_1  12 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn12
		 (NotExistingStreamConsumption
	)

happyReduce_54 = happySpecReduce_1  12 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn12
		 (DivideByZero
	)

happyReduce_55 = happySpecReduce_1  12 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn12
		 (Trap
	)

happyReduce_56 = happySpecReduce_1  12 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn12
		 (ListEmpty
	)

happyReduce_57 = happySpecReduce_1  13 happyReduction_57
happyReduction_57 _
	 =  HappyAbsSyn13
		 (BoolT
	)

happyReduce_58 = happySpecReduce_1  13 happyReduction_58
happyReduction_58 _
	 =  HappyAbsSyn13
		 (IntT
	)

happyReduce_59 = happySpecReduce_1  13 happyReduction_59
happyReduction_59 _
	 =  HappyAbsSyn13
		 (VoidT
	)

happyReduce_60 = happySpecReduce_1  13 happyReduction_60
happyReduction_60 _
	 =  HappyAbsSyn13
		 (UnitT
	)

happyReduce_61 = happySpecReduce_3  13 happyReduction_61
happyReduction_61 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (ListT happy_var_2
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  13 happyReduction_62
happyReduction_62 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (ArrowT happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  13 happyReduction_63
happyReduction_63 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (happy_var_2
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 66 66 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	MkToken _ TokenIf -> cont 14;
	MkToken _ TokenWhile -> cont 15;
	MkToken _ TokenElse -> cont 16;
	MkToken _ TokenEq -> cont 17;
	MkToken _ TokenAdd -> cont 18;
	MkToken _ TokenLCurly -> cont 19;
	MkToken _ TokenRCurly -> cont 20;
	MkToken _ TokenLSquare -> cont 21;
	MkToken _ TokenRSquare -> cont 22;
	MkToken _ TokenLParen -> cont 23;
	MkToken _ TokenRParen -> cont 24;
	MkToken _ TokenColon -> cont 25;
	MkToken _ TokenSemiColon -> cont 26;
	MkToken _ TokenLessThan -> cont 27;
	MkToken _ TokenGreaterThan -> cont 28;
	MkToken _ TokenLessThanEq -> cont 29;
	MkToken _ TokenGreaterThanEq -> cont 30;
	MkToken _ TokenLogicalEq -> cont 31;
	MkToken _ TokenNotEq -> cont 32;
	MkToken _ TokenLogicalNot -> cont 33;
	MkToken _ TokenLogicalAnd -> cont 34;
	MkToken _ TokenLogicalOr -> cont 35;
	MkToken _ TokenDivide -> cont 36;
	MkToken _ TokenMultiply -> cont 37;
	MkToken _ TokenSubtract -> cont 38;
	MkToken _ TokenModulo -> cont 39;
	MkToken _ TokenCatch -> cont 40;
	MkToken _ TokenTry -> cont 41;
	MkToken _ TokenThrow -> cont 42;
	MkToken _ (TokenNum happy_dollar_dollar) -> cont 43;
	MkToken _ TokenTInt -> cont 44;
	MkToken _ (TokenBool happy_dollar_dollar) -> cont 45;
	MkToken _ TokenTBool -> cont 46;
	MkToken _ TokenVoid -> cont 47;
	MkToken _ (TokenVar happy_dollar_dollar) -> cont 48;
	MkToken _ TokenPrint -> cont 49;
	MkToken _ TokenHead -> cont 50;
	MkToken _ TokenTail -> cont 51;
	MkToken _ TokenIsEmpty -> cont 52;
	MkToken _ TokenCons -> cont 53;
	MkToken _ TokenConsume -> cont 54;
	MkToken _ TokenInitStreams -> cont 55;
	MkToken _ TokenLambda -> cont 56;
	MkToken _ TokenArrow -> cont 57;
	MkToken _ TokenUnit -> cont 58;
	MkToken _ TokenReturn -> cont 59;
	MkToken _ TokenNPE -> cont 60;
	MkToken _ TokenSNIE -> cont 61;
	MkToken _ TokenNESCE -> cont 62;
	MkToken _ TokenDBZE -> cont 63;
	MkToken _ TokenTE -> cont 64;
	MkToken _ TokenLEE -> cont 65;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 66 tk tks = happyError' (tks, explist)
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
               | LamExpr Type String Stmt
               | Application Stmt Stmt
               | UnitVal
               | HeadOp Stmt
               | TailOp Stmt
               | IsEmptyOp Stmt
               | ConsOp Stmt Stmt
               | EmptyListVal
               | ReturnOp Stmt
               deriving (Show)

data ExceptionType = NullPointer
               | StreamsNotIntialised
               | NotExistingStreamConsumption
               | DivideByZero
               | Trap
               | ListEmpty
               deriving (Show)


data Type     = IntT
              | BoolT
              | VoidT
              | StmtT
              | UnitT
              | ListT Type
              | EmptyListT
              | ArrowT Type Type
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
