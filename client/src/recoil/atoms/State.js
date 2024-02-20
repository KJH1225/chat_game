import { atom } from "recoil";
import { recoilPersist } from 'recoil-persist';

const { persistAtom } = recoilPersist();

export const loginState = atom({
  key: 'loginState',
  default: false,
  effects_UNSTABLE: [persistAtom],
})

export const nameState = atom({
  key: 'nameState',
  default: '',
  effects_UNSTABLE: [persistAtom],
})

export const roomState = atom({
  key: 'roomState',
  default: '',
  effects_UNSTABLE: [persistAtom],
})
