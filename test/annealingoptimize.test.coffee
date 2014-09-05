AnnealingOptimize = require '../annealingoptimize'

exports.AnnealingOptimizeTest =
  # '大局的最小解を行き着けたか' : (test) ->
  #   test.expect(1)
  #   ao = new AnnealingOptimize
  #   ans = ao.annealingoptimize()
  #   test.ok(0.8 < ans and ans <= 0.9, "答え #{ans}")
  #   test.done()
  
  '[] の組み合わせパターン' : (test) ->
    test.expect(1)
    ao = new AnnealingOptimize
    ans = {}
    func = (p,d)->
      d[p] = 1
    ao.combination([],func,ans)
    ans = (i for i of ans).sort()
    test.deepEqual(ans, [])
    test.done()

  '[a] の組み合わせパターン' : (test) ->
    test.expect(1)
    ao = new AnnealingOptimize
    ans = {}
    func = (p,d)->
      d[p] = 1
    ao.combination(['a'],func,ans)
    ans = (i for i of ans).sort()
    test.deepEqual(ans, ['a'])
    test.done()

  '[a,b] の組み合わせパターン' : (test) ->
    test.expect(1)
    ao = new AnnealingOptimize
    ans = {}
    func = (p,d)->
      d[p] = 1
    ao.combination(['a','b'],func,ans)
    ans = (i for i of ans).sort()
    test.deepEqual(ans, ['aa','ab','ba','bb'])
    test.done()

  '[a,z] の組み合わせパターン' : (test) ->
    test.expect(1)
    ao = new AnnealingOptimize
    ao = new AnnealingOptimize
    ans = {}
    func = (p,d)->
      d[p] = 1
    ao.combination(['a','z'],func,ans)
    ans = (i for i of ans).sort()
    test.deepEqual(ans, ['aa','az','za','zz'])
    test.done()

  '[a,z,y] の組み合わせパターン' : (test) ->
    test.expect(1)
    ao = new AnnealingOptimize
    ans = {}
    func = (p,d)->
      d[p] = 1
    ao.combination(['a','z','y'],func,ans,10000,0.999)
    ans = (i for i of ans).sort()
    test.deepEqual(ans, ['aaa','aaz','aay','aza','azz','azy','aya','ayz','ayy','zaa','zaz','zay','zza','zzz','zzy','zya','zyz','zyy','yaa','yaz','yay','yza','yzz','yzy','yya','yyz','yyy'].sort())
    test.done()
