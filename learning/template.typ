#import "@preview/cuti:0.2.1": show-cn-fakebold
#import "@preview/unify:0.6.0": qty
#import "@preview/mitex:0.2.4": *

#let noindent() = h(-2em)
#let toprule() = table.hline(stroke: 1pt)
#let midrule() = table.hline(stroke: 0.5pt)
#let bottomrule() = table.hline(stroke: 1pt)

#let first_page(config: (:), it) = {
    set text(size: 9.5pt)
    set table.hline(stroke: .5pt)
    table(columns: (68%, 30%), align: center+horizon, stroke: none,
      image("images/head.jpg"),
      table(align: center + horizon, stroke: none, columns: (1.5cm, 4cm),
      [专业：],[#config.专业],table.hline(start: 1),
      [姓名：],[#config.姓名],table.hline(start: 1),
      [学号：],[#config.学号],table.hline(start: 1),
      [日期：],[#config.日期],table.hline(start: 1),
      [地点：],[#config.地点],table.hline(start: 1),
      ),

      table.cell([
      #table(align: center+horizon, stroke: none, columns: (13%, 25%, 13%, 20%, 17%, 18%),
      table.cell([课程名称：], align: left),[#config.课程名称],table.hline(start: 1, end: 2),
      table.cell([指导老师：], align: left),[#config.指导老师],table.hline(start: 3, end: 4),
      table.cell([成绩：], align: left),[#config.成绩],table.hline(start: 5, end: 6),
      table.cell([实验名称：], align: left),[#config.实验名称],table.hline(start: 1, end: 2),
      table.cell([实验类型：], align: left),[#config.实验类型],table.hline(start: 3, end: 4),
      table.cell([同组学生姓名：], align: left),[#config.同组学生姓名],table.hline(start: 5, end: 6),
      )
      ], colspan: 2)
    )
    it
}

#let zjuLabReport(config: (:), it) = {
/* -------------------------------------------------------------------------- */
  // 常用缩进和间距设置
  set par(leading: 1em) // 段落间距

  set par(first-line-indent: 2em)
  let fakepar=context{let b=par(box());b;v(-measure(b+b).height)}
  show math.equation.where(block: true): it=>it+fakepar // 公式后缩进
  show heading: it=>it+fakepar // 标题后缩进
  show figure: it=>it+fakepar // 图表后缩进
  show enum.item: it=>it+fakepar
  show list.item: it=>it+fakepar // 列表后缩进
  // show xxx: it=>it+fakepar // 其他需要修复缩进的元素

/* -------------------------------------------------------------------------- */
  // 设置公式引用编号，样式为：“公式 (x)”
  show ref: it => {
  let eq = math.equation
  let el = it.element
  if el != none and el.func() == eq {
      link(el.location(),numbering(
        "公式 "+el.numbering,
        ..counter(eq).at(el.location())
      ))
    } else {
      it
    }
  }

  // 设置公式编号为 (x)
  set math.equation(numbering: "(1)")
/* -------------------------------------------------------------------------- */
// 设置图表标题格式
  set figure.caption(
    separator: [: ],
  )

  show figure.where(
  kind: table
): set figure.caption(position: top)
/* -------------------------------------------------------------------------- */
  // 设置标题样式
  set heading(numbering: "1. 1. 1.  ")
  let h1 = counter(heading.where(level: 1))
  show heading.where(
    level: 1
  ): it => [
    #v(25pt, weak: true)
    #set align(center)
    #set text(size: 14pt)
    #show: show-cn-fakebold
    #h1.display("1    ") #it.body
    #v(25pt, weak: true)
  ]
  show heading.where(
    level: 2
  ): it => [
    #v(20pt, weak: true)
    #set text(size: 12pt)
    #show: show-cn-fakebold
    #set heading(level: 2, numbering: "1.1.1.")
    #it
    #v(20pt, weak: true)
  ]

  show heading.where(
    level: 3
  ): it => [
    #v(20pt, weak: true)
    #set text(size: 10.5pt)
    #show: show-cn-fakebold
    #set heading(level: 3, numbering: "1.1.1.")
    #it
    #v(20pt, weak: true)
  ]
/* -------------------------------------------------------------------------- */
  //设置字体
  set text(font: ("Times New Roman", "SimSun"), size: 10.5pt, lang: "zh")
  set page(margin: 2.5cm)

  // 设置页眉
    let remain_page_header = table(columns: (40%, 20%, 40%), stroke: none, align: (left, center, right),
      [实验名称：#config.实验名称],[姓名：#config.姓名],[学号：
      #config.学号],
      table.hline(stroke: 0.5pt)
    )

  set page(paper: "a4", header: context if counter(page).get().first() != 1{
        remain_page_header
    })

  show: first_page.with(config: config)
  it
}

