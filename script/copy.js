// Used to copy the glyphs from https://www.nerdfonts.com/cheat-sheet into a lua table

const luaTables = Object.entries(glyphs).reduce((acc, [name, code]) => {
  // Ignore deprecated glyphs
  if (!name.startsWith('nfold')) {
    // Convert the code to a glyph
    const glyph = String.fromCodePoint.apply(null, [parseInt(code, 16)]);
    acc.push(`{ '${name}', '${glyph}' }`);
  }
  return acc;
}, []);

copy(`return {\n  ${luaTables.join(',\n  ')},\n}`);
