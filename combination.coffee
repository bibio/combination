class Combination

  combination: (array) ->

    join = (array,prefix,item) ->
      array.push "#{prefix}#{item}"

    array_len = array.length
    result = array
    while  result[0] and result[0].length < array_len
      result_tmp = []
      for r in result
        join result_tmp,r,j for j in array
      result = result_tmp
      
    return result

module.exports = Combination
