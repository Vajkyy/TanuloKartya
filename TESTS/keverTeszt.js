function keverTeszt() {
    const kerdesObj = {
      valaszok: [
        { valasz: "A", helyes: 0 },
        { valasz: "B", helyes: 1 },
        { valasz: "C", helyes: 0 },
        { valasz: "D", helyes: 0 }
      ]
    };
  
    function kever() {
      const n = kerdesObj.valaszok.length;
      const tomb = [];
      while (tomb.length < n) {
        const i = Math.floor(Math.random() * n);
        if (!tomb.includes(i)) tomb.push(i);
      }
      return tomb;
    }
  
    for (let teszt = 0; teszt < 5; teszt++) {
      const eredmeny = kever();
  

      console.assert(
        eredmeny.length === kerdesObj.valaszok.length,
        `Hiba! Hibás hossz. Várt: ${kerdesObj.valaszok.length}, Kapott: ${eredmeny.length}`
      );

      const egyedi = new Set(eredmeny);
      console.assert(
        egyedi.size === eredmeny.length,
        `Hiba! Ismétlődő indexek a tömbben: ${eredmeny}`
      );
  
      for (let i = 0; i < kerdesObj.valaszok.length; i++) {
        console.assert(
          eredmeny.includes(i),
          `Hiba! Hiányzik az index: ${i} a tömbből: ${eredmeny}`
        );
      }
    }
  
    console.log("A kever() teszt lefutott.");
  }
  
  keverTeszt();
  