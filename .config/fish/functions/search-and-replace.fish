function search-and-replace --argument old new
    ag $old -l | xargs perl -pi -e "s/$old/$new/g"
end
