Combination = require '../combination'

exports.CombinationTest =

  'test single pair': (test) ->
    test.expect(1)
    combination = new Combination
    result = combination.combination ["a"]
    test.deepEqual(["a"], result)
    test.done()

  'test two pairs': (test) ->
    test.expect(1)
    combination = new Combination
    result = combination.combination ["a", "b"]
    test.deepEqual(["aa","ab","ba","bb"],  result)
    test.done()

  'test empty array': (test) ->
    test.expect(1)
    combination = new Combination
    result = combination.combination []
    test.deepEqual([] ,result, result)
    test.done()

  'test many pairs': (test) ->
    test.expect(1)
    combination = new Combination
    td = ["a", "b", "c", "d", "e", "f", "g"]
    result = combination.combination td
    test.ok(result.length is td.length**td.length, result.length)
    test.done()
