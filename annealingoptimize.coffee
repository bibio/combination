class AnnealingOptimize

  combination: (array,func=null,user_data={},t=10000,cool=0.99)->
    step = array.length
    tmin = 1.0/t

    if array.length == 0
      return []

    if func == null
      throw new Error("please specify func")

    costf = (chars) ->
      code = 0
      for ch in chars
        code += ch.charCodeAt(0)
      code

    getPattern = (a) ->
      newi = Math.floor(Math.random() * a.length)
      a[newi] for x in a

    pat = getPattern(array)
    func(pat.join(""),user_data)

    while t > tmin

      # 変更する変数を選ぶ
      i = Math.floor(Math.random() * pat.length)

      # 組み合わせを増加させるか減少させるか
      dir = Math.random()
      dir = (dir - 0.5) * step

      newpat = (m for m in pat)

      for m,n of array
        if n == pat[i]
          newi = Math.floor(dir + step - 1) % step
          # console.log dir
          # console.log m
          # console.log newi
          newpat[i] = array[newi]
          break

      # console.log newpat
      cost = costf(pat)
      newcost = costf(newpat)

      p = Math.exp(-1 * Math.abs(newcost - cost) / t)

      if (newcost < cost or Math.random() < p)
        pat = newpat
        func(pat.join(""),user_data)

      t *= cool

    return true

  annealingoptimize: (t=10000,cool=0.99,step=1)->
    vec = Math.round(Math.random() * 4 - 2)

    costf = (x) ->
      3 * (x**4) - 5 * (x**3) + 2 * (x**2)

    while t > 0.0001
      dir = Math.random()
      dir = (dir - 0.5) * step

      newvec = vec + dir

      newcost = costf(newvec)
      cost = costf(vec)

      p = Math.exp(-1*Math.abs(newcost-cost)/t)
      if (newcost < cost or Math.random() < p)
        vec = newvec

      t = t * cool

    console.log vec
    return vec

module.exports = AnnealingOptimize
