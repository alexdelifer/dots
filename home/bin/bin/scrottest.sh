!/bin/sh
#
# echo "import timing"
# echo "---"
# time for i in {1..10}; do
#     import -window root -define png:compression-level=9 test.png;
# done
# echo "
# "

echo "scrot timing"
echo "---"
time for i in {1..10}; do
    scrot --quality 1000 test.png;
done
echo "
"
#
# echo "maim timing"
# echo "---"
# time for i in {1..10}; do
#     maim --quality=10 test.png;
# done
# echo "
# "
