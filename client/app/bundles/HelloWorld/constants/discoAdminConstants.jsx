import mirrorCreator from 'mirror-creator';

const actionTypes = mirrorCreator([
  'EVENT_SELECT',
  'EVENT_CREATE',
  'EVENT_UPDATE',
  'EVENT_REMOVE',
]);

export default actionTypes;
