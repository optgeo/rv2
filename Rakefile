require './constants.rb'

desc 'create document tarball'
task :tarball do
  sh "tar cvzf docs.tar.gz docs"
end

desc 'watch the progress'
task :watch do
  sh "watch -n 10 \"date; echo -n 'to go: '; ruby yield.rb | wc -l; " +
  "echo -n 'done : '; ls #{GRID_DIR}/*.mbtiles | wc -l; vcgencmd measure_temp; " +
  "vcgencmd measure_clock arm; w \""
end

desc 'clean up'
task :clean do
  sh "rm -f #{GRID_DIR}/*.mbtiles"
  sh "rm -f #{MERGE1_DIR}/*.mbtiles"
end

desc 'yields the list of grids'
task :yield do
  s = <<-EOS
    ruby yield.rb | shuf
  EOS
  sh s.gsub(/\n/, ' ').squeeze(' ').strip
end

desc 'produce tiles'
task :produce do
  warps = [5, 25, 125].map {|v|
    <<-EOS
      gdalwarp -ts #{W/v} #{H/v}
      -r #{RESAMPLING_METHOD[v]} -overwrite
      #{TMP_DIR}/{}_#{v / 5}.tif #{TMP_DIR}/{}_#{v}.tif;
    EOS
  }
  commands = [125, 25, 5, 1].map {|v|
    <<-EOS
      gdal_polygonize.py #{TMP_DIR}/{}_#{v}.tif -f GeoJSONSeq
      -q /vsistdout/ #{LAYER} #{PROPERTY} |
      MINZOOM=#{ZOOMS[v][:minzoom]}
      MAXZOOM=#{ZOOMS[v][:maxzoom]}
      ruby filter.rb; 
    EOS
  }
  commands.push <<-EOS
    gdal_polygonize.py #{TMP_DIR}/{}_mask.tif -f GeoJSONSeq
      -q /vsistdout/ #{MASK_LAYER} #{MASK_PROPERTY} | node add_area.js;
  EOS
  deletes = [125, 25, 5, 1].map {|v|
    <<-EOS
      rm #{TMP_DIR}/{}_#{v}.tif;
    EOS
  }
  deletes.push <<-EOS
    rm #{TMP_DIR}/{}_mask.tif
  EOS
  s = <<-EOS
    ruby yield.rb | shuf |
    parallel -j 3 --line-buffer '
      echo `date` {}; 
      gdal_calc.py --calc=\"100*A\" --outfile=#{TMP_DIR}/{}_1.tif
        -A #{SRC_DIR}/{}#{SRC_EXT} --quiet --overwrite;
      gdal_calc.py --calc=\"A>10\" --outfile=#{TMP_DIR}/{}_mask.tif
        -A #{SRC_DIR}/{}#{SRC_EXT} --quiet --overwrite;
      #{warps.join}
      (#{commands.join}) |
      tippecanoe --force -o #{GRID_DIR}/{}.mbtiles
      --no-tile-size-limit
      --no-feature-limit
      --minimum-zoom=#{MINZOOM}
      --maximum-zoom=#{MAXZOOM};
      #{deletes.join}
    ';
  EOS
  if !GRID_ONLY
    s += <<-EOS
    ruby merge1.rb | sh;
    tile-join --force
    -o #{SINGLE_MBTILES} --no-tile-size-limit
    #{MERGE1_DIR}/*.mbtiles;
    tile-join --force --no-tile-compression
    --output-to-directory=docs/zxy --no-tile-size-limit
    #{SINGLE_MBTILES}
    EOS
  end
  sh s.gsub(/\n/, '').squeeze(' ').strip
end

desc 'build style'
task :style do
  #sh "curl #{BASE_STYLE_URL} | ruby style.rb > docs/style.json"
  sh "cat pale.json | ruby style.rb > docs/style.json"
end

desc 'host the site'
task :host do
  sh "budo -d docs"
end

desc 'optimize'
task :optimize do
  sh "node ~/vt-optimizer/index.js -m #{SINGLE_MBTILES}"
end

