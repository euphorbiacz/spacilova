# original: @kokes
rm hodnoceni.txt
for i in $(seq 1 42); do
	curl -s $i https://kultura.zpravy.idnes.cz/recenze-mirky-spacilove.aspx?strana=$i | grep "span class=\"rating\""| cut -d'>' -f2 | cut -d' ' -f1 >> hodnoceni.txt
done

sort -n hodnoceni.txt | uniq -c

#   1 0
#   2 5
#   9 10
#   5 15
#  11 20
#  13 25
#  37 30
#  26 35
# 105 40
#  42 45
# 269 50
# 147 55
# 330 60
# 163 65
# 210 70
#  56 75
#  62 80
#   4 85
#   2 90

# optional visualization + stats with https://github.com/bitly/data_hacks
# cat hodnoceni.txt | histogram.py --percentage --min=0 --max=100
# # NumSamples = 1494; Min = 0.00; Max = 100.00
# # Mean = 56.987952; Variance = 174.428235; SD = 13.207128; Median 60.000000
# # each ? represents a count of 6
#     0.0000 -    10.0000 [    12]: ?? (0.80%)
#    10.0000 -    20.0000 [    16]: ?? (1.07%)
#    20.0000 -    30.0000 [    50]: ???????? (3.35%)
#    30.0000 -    40.0000 [   131]: ????????????????????? (8.77%)
#    40.0000 -    50.0000 [   311]: ??????????????????????????????????????????????????? (20.82%)
#    50.0000 -    60.0000 [   477]: ??????????????????????????????????????????????????????????????????????????????? (31.93%)
#    60.0000 -    70.0000 [   373]: ?????????????????????????????????????????????????????????????? (24.97%)
#    70.0000 -    80.0000 [   118]: ??????????????????? (7.90%)
#    80.0000 -    90.0000 [     6]: ? (0.40%)
#    90.0000 -   100.0000 [     0]:  (0.00%)
