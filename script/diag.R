int<-"
digraph SEM {

graph [ranksep = 2.5, overlap=true, outputorder=edgesfirst]
'i' [shape = 'circle',color='red']
's1' [shape = 'circle',color='grey']
's2' [shape = 'circle',color='grey']
'i'->'s1' [dir='both']
'i'->'s2' [dir='both']
's1'->'s2' [dir='both']
't0' [shape = 'square']
't1' [shape = 'square']
't2' [shape = 'square']
't3' [shape = 'square']
't4' [shape = 'square']
't5' [shape = 'square']
i->t0 [label = '1',color='red', fontcolor=red]
'i'->'t1' [label = '1',color='red', fontcolor=red]
'i'->'t2' [label = '1',color='red', fontcolor=red]
'i'->'t3' [label = '1',color='red', fontcolor=red]
'i'->'t4' [label = '1',color='red', fontcolor=red]
'i'->'t5' [label = '1',color='red', fontcolor=red]
's1'->'t0' [color='grey', fontcolor=grey]
's1'->'t1' [color='grey', fontcolor=grey]
's1'->'t2' [color='grey', fontcolor=grey]
's1'->'t3' [color='grey', fontcolor=grey]
's1'->'t4' [color='grey', fontcolor=grey]
's1'->'t5' [color='grey', fontcolor=grey]
's2'->'t0' [color='grey', fontcolor=grey]
's2'->'t1' [color='grey', fontcolor=grey]
's2'->'t2' [color='grey', fontcolor=grey]
's2'->'t3' [color='grey', fontcolor=grey]
's2'->'t4' [color='grey', fontcolor=grey]
's2'->'t5' [color='grey', fontcolor=grey]

# Additional constraints on the graph
t0->t1->t2->t3->t4->t5 [style='invis']
{rank = 'same'; t0; t1; t2; t3; t4; t5;}
{rank = 'same'; i; s1;s2;}

}
"

s1<-"
digraph SEM {

graph [ranksep = 2.5, overlap=true, outputorder=edgesfirst]
'i' [shape = 'circle',color='grey']
's1' [shape = 'circle',color='blue']
's2' [shape = 'circle',color='grey']
'i'->'s1' [dir='both']
'i'->'s2' [dir='both']
's1'->'s2' [dir='both']
't0' [shape = 'square']
't1' [shape = 'square']
't2' [shape = 'square']
't3' [shape = 'square']
't4' [shape = 'square']
't5' [shape = 'square']
i->t0 [color='grey', fontcolor=grey]
'i'->'t1' [color='grey', fontcolor=grey]
'i'->'t2' [color='grey', fontcolor=grey]
'i'->'t3' [color='grey', fontcolor=grey]
'i'->'t4' [color='grey', fontcolor=grey]
'i'->'t5' [color='grey', fontcolor=grey]
's1'->'t0' [label = '0',color='blue', fontcolor=blue]
's1'->'t1' [label = '1',color='blue', fontcolor=blue]
's1'->'t2' [label = '2',color='blue', fontcolor=blue]
's1'->'t3' [label = '3',color='blue', fontcolor=blue]
's1'->'t4' [label = '3',color='blue', fontcolor=blue]
's1'->'t5' [label = '3',color='blue', fontcolor=blue]
's2'->'t0' [color='grey', fontcolor=grey]
's2'->'t1' [color='grey', fontcolor=grey]
's2'->'t2' [color='grey', fontcolor=grey]
's2'->'t3' [color='grey', fontcolor=grey]
's2'->'t4' [color='grey', fontcolor=grey]
's2'->'t5' [color='grey', fontcolor=grey]

# Additional constraints on the graph
t0->t1->t2->t3->t4->t5 [style='invis']
{rank = 'same'; t0; t1; t2; t3; t4; t5;}
{rank = 'same'; i; s1;s2;}

}
"

s2<-"
digraph SEM {

graph [ranksep = 2.5, overlap=true, outputorder=edgesfirst]
'i' [shape = 'circle',color='grey']
's1' [shape = 'circle',color='grey']
's2' [shape = 'circle',color='green']
'i'->'s1' [dir='both']
'i'->'s2' [dir='both']
's1'->'s2' [dir='both']
't0' [shape = 'square']
't1' [shape = 'square']
't2' [shape = 'square']
't3' [shape = 'square']
't4' [shape = 'square']
't5' [shape = 'square']
i->t0 [color='grey', fontcolor=grey]
'i'->'t1' [color='grey', fontcolor=grey]
'i'->'t2' [color='grey', fontcolor=grey]
'i'->'t3' [color='grey', fontcolor=grey]
'i'->'t4' [color='grey', fontcolor=grey]
'i'->'t5' [color='grey', fontcolor=grey]
's1'->'t0' [color='grey', fontcolor=grey]
's1'->'t1' [color='grey', fontcolor=grey]
's1'->'t2' [color='grey', fontcolor=grey]
's1'->'t3' [color='grey', fontcolor=grey]
's1'->'t4' [color='grey', fontcolor=grey]
's1'->'t5' [color='grey', fontcolor=grey]
's2'->'t0' [label = '0',color='green', fontcolor=green]
's2'->'t1' [label = '0',color='green', fontcolor=green]
's2'->'t2' [label = '0',color='green', fontcolor=green]
's2'->'t3' [label = '0',color='green', fontcolor=green]
's2'->'t4' [label = '1',color='green', fontcolor=green]
's2'->'t5' [label = '2',color='green', fontcolor=green]

# Additional constraints on the graph
t0->t1->t2->t3->t4->t5 [style='invis']
{rank = 'same'; t0; t1; t2; t3; t4; t5;}
{rank = 'same'; i; s1;s2;}

}
"