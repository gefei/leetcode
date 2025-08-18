import itertools as it

class Solution:
    def judgePoint24(self, cards: list[int]) -> bool:
        return has_solution(cards, 24)

def eval_expr(a):
    stk = []
    for x in a:
      if x in ['+','-','*','/']:
         a1,a2 = float(stk.pop()), float(stk.pop())
         t = a1+a2 if x=='+' else a1-a2 if x=='-' else a1*a2 if x=='*' else float(a1)/a2
         stk.append(t)
      else: stk.append(x)
    return stk[0]

def has_solution(nu, x):
    for nu_p in it.permutations(nu):
      for op_p in it.product('+-*/', repeat=3):
        t = list(nu_p)
        q = list(op_p)
        a1 = [t[0],t[1],q[0],t[2],t[3],q[1],q[2]]
        a2 = [t[0],t[1],q[0],t[2],q[1],t[3],q[2]]
        a3 = [t[0],t[1],t[2],q[0],q[1],t[3],q[2]]
        a4 = [t[0],t[1],t[2],t[3],q[0],q[1],q[2]]
        try:
          if x-0.1 <= eval_expr(a1) <= x+0.1 : return True
          if x-0.1 <= eval_expr(a2) <= x+0.1 : return True
          if x-0.1 <= eval_expr(a3) <= x+0.1 : return True
          if x-0.1 <= eval_expr(a4) <= x+0.1 : return True
        except:
          pass
    return False