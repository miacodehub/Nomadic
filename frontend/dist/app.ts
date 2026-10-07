export interface Place {
  name: string;
  description: string;
  popularity: number; // 1-100, where 100 = super famous
}

export const places: Place[] = [
  { name: "Example Place", description: "One sentence about it.", popularity: 20 },
  
];

console.log(places);