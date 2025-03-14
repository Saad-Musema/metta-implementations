from hyperon import MeTTa
metta = MeTTa()
result = metta.run('''
   (= (foo) boo)
   ! (foo)
   ! (match &self (= ($f) boo) $f)
''')
print(result) # [[boo], [foo]]

from hyperon import S, SymbolAtom, Atom
symbol_atom = S('MyNewAtom')
print(symbol_atom.get_name()) # MyAtom
print(symbol_atom.get_metatype()) # AtomKind.SYMBOL
print(type(symbol_atom)) # SymbolAtom
print(isinstance(symbol_atom, SymbolAtom)) # True
print(isinstance(symbol_atom, Atom)) # True


from hyperon import *
metta = MeTTa()
entry = E(S('my-key'), G({'a': 1, 'b': 2}))
another_entry = E(S('another-key'), G({'c': 3, 'd': 4}))
metta.space().add_atom(entry)
metta.space().add_atom(another_entry)
result = metta.run('! (match &self (my-key $x) $x)')[0][0]

print(type(result)) # GroundedAtom
print(result.get_object()) # {'a': 1, 'b': 2}


from hyperon import *
print("New Functions")
metta = MeTTa()
expr1 = metta.parse_single('(+ 1 S)')
expr2 = E(S('+'), S('1'), S('S'))
print('Expr1: ', expr1)
print('Expr2: ', expr2)
print('Equal: ', expr1 == expr2)

for atom in expr1.get_children():
    print(f'type({atom})={type(atom)}')
    
print("New Evaluation of Expression")
from hyperon import *
metta = MeTTa()
expr1 = metta.parse_single('(+ 1 2)')
print(metta.evaluate_atom(expr1))
expr2 = E(OperationAtom('+', lambda a, b: a + b),
          ValueAtom(1), ValueAtom(2))
print(metta.evaluate_atom(expr1))
print(metta.evaluate_atom(expr2))
print(expr1 == expr2)

print(expr1.get_metatype)

from hyperon import *
def print_all(*args):
    for a in args:
        print(a)
    return [Atoms.UNIT]
metta = MeTTa()
metta.register_atom("print-all", OperationAtom("print-all", print_all))
metta.run('(print-all "Hello" (+ 40 2) "World")')


from hyperon import *
def find_pos(x:str, y="l", left=True):
    if left:
        return x.find(y)
    pos = x[-1:].find(y)
    return len(x) - 1 - pos if pos >= 0 else pos
metta = MeTTa()
metta.register_atom("find-pos", OperationAtom("find-pos", find_pos))
print(metta.run('''
 ! (find-pos "alpha") ; 0
 ! (find-pos (Kwargs (x "alpha") (left False))) ; 4
 ! (find-pos (Kwargs (x "alpha") (y "c") (left False))) ; -1
'''))

print("Calculation")
from hyperon import *
metta = MeTTa()
plus = metta.parse_single('+')
print(type(plus.get_object())) # OperationObject
print(plus.get_object().op) # some lambda
print(plus.get_object()) # + as a representation of this operation
calc = metta.run('! (+ 1 2)')[0][0]
print(type(calc.get_object())) # ValueObject
print(calc.get_object().value) # 3

metta.run('(my-secret-symbol 42)') # add the expression to the space
pattern = E(V('x'), ValueAtom(42))
print(metta.space().query(pattern)) # { $x <- my-secret-symbol }