command -v lessc >/dev/null 2>&1 || { echo >&2 "lessc doesn't exist. install it using npm install -g less"; exit 1; }
lessc source/less/VMM.Timeline.less > compiled/css/timeline.css -x --yui-compress
lessc source/less/Theme/Dark.less > compiled/css/themes/dark.css -x --yui-compress

echo "Compiling all LESS font files to CSS"
for file in source/less/Core/Font/*.less
do
    FROM=$file
    TO=${file/.*/.css}
    echo "$FROM --> $TO"
    lessc $FROM > $TO -x --yui-compress
done

mv source/less/Core/Font/*.css compiled/css/themes/font/
