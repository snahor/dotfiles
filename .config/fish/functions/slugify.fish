function slugify -a string
    echo $string | tr " " - | tr "," -
end
