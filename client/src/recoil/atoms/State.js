import { atom } from "recoil";
import { recoilPersist } from 'recoil-persist';

const { persistAtom } = recoilPersist();

export const loginState = atom({
  key: 'loginState',
  default: false,
  effects_UNSTABLE: [persistAtom],
})

export const startDateState = atom({
  key: 'startDateState',
  default: '2023-11-17',
  effects_UNSTABLE: [persistAtom],
})


export const timeState = atom({
  key: 'timeState',
  default: '',
  effects_UNSTABLE: [persistAtom],
})

export const plannerState = atom({
  key: 'plannerState',
  default: '',
  effects_UNSTABLE: [persistAtom],
})  

export const plannerIdState = atom({
  key: 'plannerIdState',
  default: '',
  effects_UNSTABLE: [persistAtom],
})

export const pointState = atom({
  key: 'pointState',
  default: '',
  effects_UNSTABLE: [persistAtom],
})

export const contactChoiceState = atom({
  key: 'contactChoiceState',
  default: '',
  effects_UNSTABLE: [persistAtom],
})

export const themeState = atom({
  key: 'themeState',
  default: '',
  effects_UNSTABLE: [persistAtom],
})
