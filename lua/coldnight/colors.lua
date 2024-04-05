local colors = {
  white = '#FFFFFF',
  black = '#000000',
}

--- Generate colors based `vim.o.background` and a variant.
function colors.generate()
  if vim.o.background == 'dark' then
    colors.bg = '#1B1B1B'
    colors.bgmid = '#272727'
    colors.bgmidlight = '#2A2A2A'
    colors.bglight = '#767676'
    colors.fg = '#BEBEBE'
    colors.brightsky = '#5F89AD'
    colors.brightersky = '#81A2BE'
    colors.skylighter = '#8DABC5'
    colors.water = '#B8DCFC'
    colors.water1 = '#EDFEFF'
    colors.sky = '#ADD5A8'
    colors.sky1 = '#ADD5A8'
    colors.sand = '#CFCFCF'
    colors.wood = '#FABD2F'
    colors.wood1 = '#FFFF7F'
    colors.leaf = '#B8BB26'
    colors.leaf1 = '#FBFF7D'
    colors.rose = '#FB4934'
    colors.rose1 = '#FF9F89'
    colors.blossom = '#D3869B'
    colors.blossom1 = '#D0878D'
  else
    colors.white = '#000000'
    colors.bg = '#E0E0E0'
    colors.bgmid = '#DEDEDE'
    colors.bglight = '#959595'
    colors.bgmidlight = '#D0D0D0'
    colors.fg = '#32373A'
    colors.water = '#7196B6'
    colors.sky = '#5CAB53'
    colors.brightsky = '#5F89AD'
    colors.brightersky = '#81A2BE'
    colors.skylighter = '#8DABC5'
    colors.water1 = '#EDFEFF'
    colors.sky1 = '#ADD5A8'
    colors.sand = '#CFCFCF'
    colors.wood = '#FABD2F'
    colors.wood1 = '#FFFF7F'
    colors.leaf = '#B8BB26'
    colors.leaf1 = '#FBFF7D'
    colors.rose = '#FB4934'
    colors.rose1 = '#FF9F89'
    colors.blossom = '#D3869B'
    colors.blossom1 = '#D0878D'
  end
end

return colors
