
00. 文字列の逆順

文字列"stressed"の文字を逆に（末尾から先頭に向かって）並べた文字列を得よ．


```python
# 0
s = "stressed"
print(s[::-1])
```

    desserts
    

01. 「パタトクカシーー」

「パタトクカシーー」という文字列の1,3,5,7文字目を取り出して連結した文字列を得よ．


```python
s = "パタトクカシーー"
s[::2]
```




    'パトカー'



02. 「パトカー」＋「タクシー」＝「パタトクカシーー」

「パトカー」＋「タクシー」の文字を先頭から交互に連結して文字列「パタトクカシーー」を得よ．


```python
s1 = "パトカー"
s2 = "タクシー"
''.join(s1[i]+s2[i] for i in range(len(s1)))
```




    'パタトクカシーー'



03. 円周率

"Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."という文を単語に分解し，各単語の（アルファベットの）文字数を先頭から出現順に並べたリストを作成せよ．


```python
# "."や","を数えてはいけないので、正規表現を推奨

import re

s = "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."
a = [len(i) for i in re.findall(r'[a-zA-Z]+', s)]
a
```




    [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7, 9]



04. 元素記号

"Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can."という文を単語に分解し，1, 5, 6, 7, 8, 9, 15, 16, 19番目の単語は先頭の1文字，それ以外の単語は先頭に2文字を取り出し，取り出した文字列から単語の位置（先頭から何番目の単語か）への連想配列（辞書型もしくはマップ型）を作成せよ．



```python
s = "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can."
one_char =[1,5,6,7,8,9,15,16,19]
ans_dict = {}
# ans_dict.__class__
a = s.split()
for idx, i in enumerate(a):
#     print(idx, i)
    i = i[0:2]
    flag = False
    for j in one_char:
        if (j==idx+1):
            flag = True
    if (flag):
        i=i[0]
    ans_dict[i] = idx+1

print(ans_dict)
```

    {'H': 1, 'He': 2, 'Li': 3, 'Be': 4, 'B': 5, 'C': 6, 'N': 7, 'O': 8, 'F': 9, 'Ne': 10, 'Na': 11, 'Mi': 12, 'Al': 13, 'Si': 14, 'P': 15, 'S': 16, 'Cl': 17, 'Ar': 18, 'K': 19, 'Ca': 20}
    

05. n-gram

与えられたシーケンス（文字列やリストなど）からn-gramを作る関数を作成せよ．この関数を用い，"I am an NLPer"という文から単語bi-gram，文字bi-gramを得よ．


```python
s = "I am an NLPer"
# tango bi-gram
s_without_space = s.replace(" ", "")
# s_without_space
letter_bi_gram = [s_without_space[i:i+2] for i in range(len(s_without_space)-1)]
print(letter_bi_gram)

word_bi_gram = [s.split()[i:i+2] for i in range(len(s.split())-1)]
print(word_bi_gram)
```

    ['Ia', 'am', 'ma', 'an', 'nN', 'NL', 'LP', 'Pe', 'er']
    [['I', 'am'], ['am', 'an'], ['an', 'NLPer']]
    

06. 集合

"paraparaparadise"と"paragraph"に含まれる文字bi-gramの集合を，それぞれ, XとYとして求め，XとYの和集合，積集合，差集合を求めよ．さらに，'se'というbi-gramがXおよびYに含まれるかどうかを調べよ．


```python
s1 = "paraparaparadise"
s2 = "paragraph"
s1_bi_gram = [s1[i:i+2] for i in range(len(s1)-1)]
s2_bi_gram = [s2[i:i+2] for i in range(len(s2)-1)]
x = set(s1_bi_gram)
y = set(s2_bi_gram)
print("X: ", x)
print("Y: ", y)
union = x | y
intersection = x & y
diff1 = x - y #x-y
diff2 = y - x #y-x
print("x + y: ", union)
print("x * y: ", intersection)
print("x - y: ", diff1)
print("y - x: ", diff2)
```

    X:  {'is', 'se', 'ap', 'ad', 'ra', 'pa', 'ar', 'di'}
    Y:  {'ap', 'ag', 'ra', 'ph', 'pa', 'ar', 'gr'}
    x + y:  {'is', 'se', 'ap', 'ad', 'ag', 'ra', 'ph', 'pa', 'ar', 'gr', 'di'}
    x * y:  {'pa', 'ra', 'ap', 'ar'}
    x - y:  {'is', 'se', 'di', 'ad'}
    y - x:  {'ph', 'gr', 'ag'}
    

07. テンプレートによる文生成

引数x, y, zを受け取り「x時のyはz」という文字列を返す関数を実装せよ．さらに，x=12, y="気温", z=22.4として，実行結果を確認せよ．



```python
x = 12
y = "気温"
z = 22.4
# print("{}時の{}は{}".format(x,y,z))
print(f"{x}時の{y}は{z}")
```

    12時の気温は22.4
    

08. 暗号文
与えられた文字列の各文字を，以下の仕様で変換する関数cipherを実装せよ．

英小文字ならば(219 - 文字コード)の文字に置換
その他の文字はそのまま出力
この関数を用い，英語のメッセージを暗号化・復号化せよ．



```python
def cipher(s):
    return ''.join(chr(219-ord(c)) if 'a' <= c <='z' else c for c in s)

cipher("abcdE")
```




    'zyxwE'



09. Typoglycemia

スペースで区切られた単語列に対して，各単語の先頭と末尾の文字は残し，それ以外の文字の順序をランダムに並び替えるプログラムを作成せよ．ただし，長さが４以下の単語は並び替えないこととする．適当な英語の文（例えば"I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."）を与え，その実行結果を確認せよ．


```python
import random

paragram = "I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."
paragram_split = paragram.split()
paragram_split_random = [''.join([s[0]] + random.sample(s[1:len(s)-1], len(s)-2) + [s[-1]]) if len(s) > 4 else s for s in paragram_split]
print(' '.join(paragram_split_random))
```

    I con'ldut belivee that I cuold altucaly uestardnnd what I was rdenaig : the pnemaonhel pweor of the hmuan mind .
    
