cd source/js/Core/Embed
cat "../Library/LazyLoad.js" "Embed.LoadLib.js" Embed.js  > "../../../../compiled/js/timeline-embed-full.js"
cd ../..
cat VMM.Timeline.License.js "Core/Core/VMM.js" "Core/Core/VMM.Library.js" "Core/Core/VMM.Browser.js" "Core/Core/VMM.FileExtention.js" "Core/Core/VMM.Date.js" "Core/Core/VMM.Util.js" "Core/Core/VMM.LoadLib.js" "Core/Core/VMM.Core.js" "Core/Language/VMM.Language.js" "Core/Media/VMM.ExternalAPI.js" "Core/Media/VMM.MediaElement.js" "Core/Media/VMM.MediaType.js" "Core/Media/VMM.Media.js" "Core/Media/VMM.TextElement.js" "Core/Slider/VMM.DragSlider.js" "Core/Slider/VMM.Slider.js" "Core/Slider/VMM.Slider.Slide.js" "Core/Library/AES.js" "Core/Library/bootstrap-tooltip.js" "Core/VMM.StoryJS.js" VMM.Timeline.js VMM.Timeline.TimeNav.js VMM.Timeline.DataObj.js > "../../compiled/js/timeline.js"
cd ../..
echo minifying .js files using Google Closure
java -jar compiler.jar --compilation_level SIMPLE_OPTIMIZATIONS --js compiled/js/timeline-embed-full.js > compiled/js/storyjs-embed.js
rm compiled/js/timeline-embed-full.js
java -jar compiler.jar --compilation_level SIMPLE_OPTIMIZATIONS --js compiled/js/timeline.js > compiled/js/timeline-min.js
cp source/js/Core/Language/locale/*.js compiled/js/locale
java -jar compiler.jar --compilation_level SIMPLE_OPTIMIZATIONS --js plugins/timelineSearch.js > compiled/js/timelineSearch.js
