function lidardata(robotposition,map) 

trans = map';

if trans(robotposition(1),robotposition(2)) == 1
for i=1:10
    if trans(robotposition(1)+i,robotposition(2)) == 1
        scatter(robotposition(1)+i,robotposition(2),30,"b",'filled','s','MarkerFaceAlpha',.5)
    else
        break
    end
    
end
for i=1:10
        if trans(robotposition(1)-i,robotposition(2)) == 1
        scatter(robotposition(1)-i,robotposition(2),30,"b",'filled','s','MarkerFaceAlpha',.5)
    else
        break
    end
end
end

if trans(robotposition(1),robotposition(2)) == 1
for i=1:9
    if trans(robotposition(1),robotposition(2)+1) == 1
        scatter(robotposition(1),robotposition(2)+1,30,"b",'filled','s','MarkerFaceAlpha',.5)
        if trans(robotposition(1)+i,robotposition(2)+1) == 1
            scatter(robotposition(1)+i,robotposition(2)+1,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

for i=1:9
    if trans(robotposition(1)-i,robotposition(2)+1) == 1
        scatter(robotposition(1)-i,robotposition(2)+1,30,"b",'filled','s','MarkerFaceAlpha',.5)
    else
        break
    end
end
end


if trans(robotposition(1),robotposition(2)) == 1
for i=1:9
    if trans(robotposition(1),robotposition(2)-1) == 1
        scatter(robotposition(1),robotposition(2)-1,30,"b",'filled','s','MarkerFaceAlpha',.5)
        if trans(robotposition(1)+i,robotposition(2)-1) == 1
            scatter(robotposition(1)+i,robotposition(2)-1,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

for i=1:9
    if trans(robotposition(1)-i,robotposition(2)-1) == 1
        scatter(robotposition(1)-i,robotposition(2)-1,30,"b",'filled','s','MarkerFaceAlpha',.5)
    else
        break
    end
end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1
    for i=1:9
        if trans(robotposition(1),robotposition(2)+2) == 1
            scatter(robotposition(1),robotposition(2)+2,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)+2) == 1
                scatter(robotposition(1)+i,robotposition(2)+2,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:9
        if trans(robotposition(1)-i,robotposition(2)+2) == 1
            scatter(robotposition(1)-i,robotposition(2)+2,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1
    for i=1:9
        if trans(robotposition(1),robotposition(2)-2) == 1
            scatter(robotposition(1),robotposition(2)-2,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)-2) == 1
                scatter(robotposition(1)+i,robotposition(2)-2,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:9
        if trans(robotposition(1)-i,robotposition(2)-2) == 1
            scatter(robotposition(1)-i,robotposition(2)-2,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1 && ...
        trans(robotposition(1),robotposition(2)+2)==1
    for i=1:9
        if trans(robotposition(1),robotposition(2)+3) == 1
            scatter(robotposition(1),robotposition(2)+3,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)+3) == 1
                scatter(robotposition(1)+i,robotposition(2)+3,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:9
        if trans(robotposition(1)-i,robotposition(2)+3) == 1
            scatter(robotposition(1)-i,robotposition(2)+3,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1 && ...
        trans(robotposition(1),robotposition(2)-2)==1
    for i=1:9
        if trans(robotposition(1),robotposition(2)-3) == 1
            scatter(robotposition(1),robotposition(2)-3,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)-3) == 1
                scatter(robotposition(1)+i,robotposition(2)-3,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:9
        if trans(robotposition(1)-i,robotposition(2)-3) == 1
            scatter(robotposition(1)-i,robotposition(2)-3,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1 && ...
        trans(robotposition(1),robotposition(2)+2)==1 && trans(robotposition(1),robotposition(2)+3)==1
    for i=1:9
        if trans(robotposition(1),robotposition(2)+4) == 1
            scatter(robotposition(1),robotposition(2)+4,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)+4) == 1
                scatter(robotposition(1)+i,robotposition(2)+4,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:9
        if trans(robotposition(1)-i,robotposition(2)+4) == 1
            scatter(robotposition(1)-i,robotposition(2)+4,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1 && ...
        trans(robotposition(1),robotposition(2)-2)==1 && trans(robotposition(1),robotposition(2)-3)==1
    for i=1:9
        if trans(robotposition(1),robotposition(2)-4) == 1
            scatter(robotposition(1),robotposition(2)-4,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)-4) == 1
                scatter(robotposition(1)+i,robotposition(2)-4,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:9
        if trans(robotposition(1)-i,robotposition(2)-4) == 1
            scatter(robotposition(1)-i,robotposition(2)-4,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1 && ...
        trans(robotposition(1),robotposition(2)+2)==1 && trans(robotposition(1),robotposition(2)+3)==1 && ...
        trans(robotposition(1),robotposition(2)+4)==1
    for i=1:8
        if trans(robotposition(1),robotposition(2)+5) == 1
            scatter(robotposition(1),robotposition(2)+5,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)+5) == 1
                scatter(robotposition(1)+i,robotposition(2)+5,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:8
        if trans(robotposition(1)-i,robotposition(2)+5) == 1
            scatter(robotposition(1)-i,robotposition(2)+5,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1 && ...
        trans(robotposition(1),robotposition(2)-2)==1 && trans(robotposition(1),robotposition(2)-3)==1 && ...
        trans(robotposition(1),robotposition(2)-4)==1
    for i=1:8
        if trans(robotposition(1),robotposition(2)-5) == 1
            scatter(robotposition(1),robotposition(2)-5,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)-5) == 1
                scatter(robotposition(1)+i,robotposition(2)-5,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:8
        if trans(robotposition(1)-i,robotposition(2)-5) == 1
            scatter(robotposition(1)-i,robotposition(2)-5,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1 && ...
        trans(robotposition(1),robotposition(2)+2)==1 && trans(robotposition(1),robotposition(2)+3)==1 && ...
        trans(robotposition(1),robotposition(2)+4)==1 && trans(robotposition(1),robotposition(2)+5)==1 
    for i=1:8
        if trans(robotposition(1),robotposition(2)+6) == 1
            scatter(robotposition(1),robotposition(2)+6,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)+6) == 1
                scatter(robotposition(1)+i,robotposition(2)+6,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:8
        if trans(robotposition(1)-i,robotposition(2)+6) == 1
            scatter(robotposition(1)-i,robotposition(2)+6,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1 && ...
        trans(robotposition(1),robotposition(2)-2)==1 && trans(robotposition(1),robotposition(2)-3)==1 && ...
        trans(robotposition(1),robotposition(2)-4)==1 && trans(robotposition(1),robotposition(2)-5)==1
    for i=1:8
        if trans(robotposition(1),robotposition(2)-6) == 1
            scatter(robotposition(1),robotposition(2)-6,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)-6) == 1
                scatter(robotposition(1)+i,robotposition(2)-6,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:8
        if trans(robotposition(1)-i,robotposition(2)-6) == 1
            scatter(robotposition(1)-i,robotposition(2)-6,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1 && ...
        trans(robotposition(1),robotposition(2)+2)==1 && trans(robotposition(1),robotposition(2)+3)==1 && ...
        trans(robotposition(1),robotposition(2)+4)==1 && trans(robotposition(1),robotposition(2)+5)==1 && ...
        trans(robotposition(1),robotposition(2)+6)==1 
    for i=1:7
        if trans(robotposition(1),robotposition(2)+7) == 1
            scatter(robotposition(1),robotposition(2)+7,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)+7) == 1
                scatter(robotposition(1)+i,robotposition(2)+7,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:7
        if trans(robotposition(1)-i,robotposition(2)+7) == 1
            scatter(robotposition(1)-i,robotposition(2)+7,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1 && ...
        trans(robotposition(1),robotposition(2)-2)==1 && trans(robotposition(1),robotposition(2)-3)==1 && ...
        trans(robotposition(1),robotposition(2)-4)==1 && trans(robotposition(1),robotposition(2)-5)==1 && ...
        trans(robotposition(1),robotposition(2)-6)==1
    for i=1:7
        if trans(robotposition(1),robotposition(2)-7) == 1
            scatter(robotposition(1),robotposition(2)-7,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)-7) == 1
                scatter(robotposition(1)+i,robotposition(2)-7,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:7
        if trans(robotposition(1)-i,robotposition(2)-7) == 1
            scatter(robotposition(1)-i,robotposition(2)-7,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1 && ...
        trans(robotposition(1),robotposition(2)+2)==1 && trans(robotposition(1),robotposition(2)+3)==1 && ...
        trans(robotposition(1),robotposition(2)+4)==1 && trans(robotposition(1),robotposition(2)+5)==1 && ...
        trans(robotposition(1),robotposition(2)+6)==1 && trans(robotposition(1),robotposition(2)+7)==1 
    for i=1:6
        if trans(robotposition(1),robotposition(2)+8) == 1
            scatter(robotposition(1),robotposition(2)+8,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)+8) == 1
                scatter(robotposition(1)+i,robotposition(2)+8,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:6
        if trans(robotposition(1)-i,robotposition(2)+8) == 1
            scatter(robotposition(1)-i,robotposition(2)+8,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1 && ...
        trans(robotposition(1),robotposition(2)-2)==1 && trans(robotposition(1),robotposition(2)-3)==1 && ...
        trans(robotposition(1),robotposition(2)-4)==1 && trans(robotposition(1),robotposition(2)-5)==1 && ...
        trans(robotposition(1),robotposition(2)-6)==1 && trans(robotposition(1),robotposition(2)-7)==1 
    for i=1:6
        if trans(robotposition(1),robotposition(2)-8) == 1
            scatter(robotposition(1),robotposition(2)-8,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)-8) == 1
                scatter(robotposition(1)+i,robotposition(2)-8,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:6
        if trans(robotposition(1)-i,robotposition(2)-8) == 1
            scatter(robotposition(1)-i,robotposition(2)-8,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1 && ...
        trans(robotposition(1),robotposition(2)+2)==1 && trans(robotposition(1),robotposition(2)+3)==1 && ...
        trans(robotposition(1),robotposition(2)+4)==1 && trans(robotposition(1),robotposition(2)+5)==1 && ...
        trans(robotposition(1),robotposition(2)+6)==1 && trans(robotposition(1),robotposition(2)+7)==1 && ...
        trans(robotposition(1),robotposition(2)+8)==1  
    for i=1:4
        if trans(robotposition(1),robotposition(2)+9) == 1
            scatter(robotposition(1),robotposition(2)+9,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)+9) == 1
                scatter(robotposition(1)+i,robotposition(2)+9,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:4
        if trans(robotposition(1)-i,robotposition(2)+9) == 1
            scatter(robotposition(1)-i,robotposition(2)+9,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end

if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1 && ...
        trans(robotposition(1),robotposition(2)-2)==1 && trans(robotposition(1),robotposition(2)-3)==1 && ...
        trans(robotposition(1),robotposition(2)-4)==1 && trans(robotposition(1),robotposition(2)-5)==1 && ...
        trans(robotposition(1),robotposition(2)-6)==1 && trans(robotposition(1),robotposition(2)-7)==1 && ...
        trans(robotposition(1),robotposition(2)-8)==1 
    for i=1:4
        if trans(robotposition(1),robotposition(2)-9) == 1
            scatter(robotposition(1),robotposition(2)-9,30,"b",'filled','s','MarkerFaceAlpha',.5)
            if trans(robotposition(1)+i,robotposition(2)-9) == 1
                scatter(robotposition(1)+i,robotposition(2)-9,30,"b",'filled','s','MarkerFaceAlpha',.5)
            else
                break
            end
        end
    end

    for i=1:4
        if trans(robotposition(1)-i,robotposition(2)-9) == 1
            scatter(robotposition(1)-i,robotposition(2)-9,30,"b",'filled','s','MarkerFaceAlpha',.5)
        else
            break
        end
    end
end


if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)+1)==1 && ...
        trans(robotposition(1),robotposition(2)+2)==1 && trans(robotposition(1),robotposition(2)+3)==1 && ...
        trans(robotposition(1),robotposition(2)+4)==1 && trans(robotposition(1),robotposition(2)+5)==1 && ...
        trans(robotposition(1),robotposition(2)+6)==1 && trans(robotposition(1),robotposition(2)+7)==1 && ...
        trans(robotposition(1),robotposition(2)+8)==1 &&  trans(robotposition(1),robotposition(2)+9)==1 && ...
        trans(robotposition(1),robotposition(2)+10)==1
    scatter(robotposition(1),robotposition(2)+10,30,"b",'filled','s','MarkerFaceAlpha',.5)
end

if trans(robotposition(1),robotposition(2))==1 && trans(robotposition(1),robotposition(2)-1)==1 && ...
        trans(robotposition(1),robotposition(2)-2)==1 && trans(robotposition(1),robotposition(2)-3)==1 && ...
        trans(robotposition(1),robotposition(2)-4)==1 && trans(robotposition(1),robotposition(2)-5)==1 && ...
        trans(robotposition(1),robotposition(2)-6)==1 && trans(robotposition(1),robotposition(2)-7)==1 && ...
        trans(robotposition(1),robotposition(2)-8)==1 &&  trans(robotposition(1),robotposition(2)-9)==1 && ...
        trans(robotposition(1),robotposition(2)-10)==1
    scatter(robotposition(1),robotposition(2)-10,30,"b",'filled','s','MarkerFaceAlpha',.5)
end

scatter(robotposition(1),robotposition(2),30,"r",'filled','s','MarkerFaceAlpha',.5)



