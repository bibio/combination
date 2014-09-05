class Combination

  combination: (array) ->

    array_len = array.length
    result = array
    while  result[0] and result[0].length < array_len
      result_tmp = []
      i = 0
      for prefix in result
        for j in array
          result_tmp[i] = "#{prefix}#{j}"
          i += 1
      result = result_tmp
      
    return result

module.exports = Combination
